--This AppleScript allows you to complete bibliographic references of EU court cases in BibDesk (macOS). It uses the information in the title field of a reference (and, if available, other information such as the ECLI number) and then searches the EU database via SPARQL for matches. It will fill out the rest of the reference in BibDesk and download the judgment, court opinion or AG opinion in PDF. 

--Prerequisites: The script assumes that you are using OSCOLA as a reference style (see the oscola biblatex package by Paul Stanley). For instance, it assumes you have fields called "Ecli" and "Number" and it will put "Opinion" (for Court opinion) or "Opinion of Advocate General [Name] in" in the Type field.  The script could quite easily be tweaked, however, to fit another reference style. The script also contains a few features that are specific to my database and so may be deleted (e.g. it checks whether there isn't already an ECLI number in the Pages field or year in the citekey).

--Tips: Court opinions don't have clear titles and so are not easy to retrieve. Putting e.g. "Opinion 2/91" in the title field should work. That title will subsequently have to be amended manually (to "ILO Convention", say) because the script will already put "2/91" in the number field.

--Timothy Roes (2021)

global theTitle

tell application "BibDesk"
	activate
	set theDoc to get first document
	tell theDoc
		
		set theSelection to the selection
		try
			set thePub to get item 1 of theSelection
		on error errStr number errorNumber
			if the errorNumber is equal to -1728 then
				display dialog "Please select a case first"
				return
			else
				error errStr number errorNumber
			end if
		end try
		tell thePub
			--GET DATA FOR SEARCH FROM REFERENCE IN BIBDESK and CLEAN IT UP
			set theTitleRaw to value of field "Title"
			set theTitle to (do shell script "sed 's= \\(([^)]*)\\)==g'<<<" & quoted form of theTitleRaw & " | sed 's/[\\.{}\\]//g'" & " | sed 's/and Others//g'") --remove (shorttitle),{}'s and \'s from title, and trailing white space, "and Others"
			
			if cite key is not "" then
				set theCiteKey to cite key
				set theCiteKeyYear to do shell script "/usr/local/bin/awk -F: '{sub( /[a-z]+/,\"\",$3); print $3}' <<<" & quoted form of theCiteKey --pull year from citekey
			end if
			
			if theCiteKeyYear is "" then --might happen if citekey was empty or did not contain year
				set theCiteKeyYear to ":" --should then match any ECLI
			end if
			
			
			if value of field "Pages" contains "EU:" then -- Get full ECLI from Pages field if avaialble
				set theCiteKeyYear to value of field "pages"
			end if
			
			if value of field "ecli" contains "EU:" then --Get full ECLI from ecli field if available
				set theCiteKeyYear to value of field "ecli"
			end if
			
			--CONCATENATE SPARQL QUERY
			--if there is an ECLI available, search only on ECLI. 
			
			if theCiteKeyYear contains "EU" then --this means it really is a true ECLI number
				set theECLI to "ECLI:" & theCiteKeyYear
				set theQueryp1 to "PREFIX cdm: <http://publications.europa.eu/ontology/cdm#>
							SELECT DISTINCT ?work ?expression ?ecli ?celex ?alttitle ?agname ?title
							WHERE {{
							?work a ?class.
       						?expression cdm:expression_belongs_to_work ?work.
      							?expression cdm:expression_title ?title.
    							?expression cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG>.
       						?work cdm:case-law_ecli "
				set theQueryp2 to "^^<http://www.w3.org/2001/XMLSchema#string>.
							?work cdm:resource_legal_id_celex ?celex.
      						    OPTIONAL{?expression cdm:expression_case-law_parties|cdm:expression_title_alternative ?alttitle}}
							UNION{?work a ?class.
       						?expression cdm:expression_belongs_to_work ?work.
      							?expression cdm:expression_title ?title.
    							?expression cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG>.
       						?work cdm:case-law_ecli "
				set theQueryp3 to "^^<http://www.w3.org/2001/XMLSchema#string>.
							?work cdm:resource_legal_id_celex ?celex.
                                               ?work cdm:case-law_delivered_by_advocate-general ?ag.
                                                     ?ag cdm:agent_name ?agname.
      						OPTIONAL{?expression cdm:expression_case-law_parties|cdm:expression_title_alternative ?alttitle}
                                                   }
       						FILTER(?class in (<http://publications.europa.eu/ontology/cdm#judgement>,<http://publications.europa.eu/ontology/cdm#opinion_cjeu>,<http://publications.europa.eu/ontology/cdm#case-law>,<http://publications.europa.eu/ontology/cdm#opinion_advocate-general>))}
                            			LIMIT 15"
				set theQuery to theQueryp1 & quoted form of theECLI & theQueryp2 & quoted form of theECLI & theQueryp3
				
				--Else, search title OR alternative title AND year (within ecli).
			else
				set theQueryp1 to "PREFIX cdm: <http://publications.europa.eu/ontology/cdm#>
							SELECT ?work ?expression ?ecli ?celex ?alttitle ?agname ?title
							WHERE {{
							?work a ?class.
       						?expression cdm:expression_belongs_to_work ?work.
      							?expression cdm:expression_title ?title.
    							?expression cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG>.
       						?work cdm:case-law_ecli ?ecli.
       						?work cdm:resource_legal_id_celex ?celex.
      							OPTIONAL{?expression cdm:expression_case-law_parties|cdm:expression_title_alternative ?alttitle}}
							UNION{?work a ?class.
       						?expression cdm:expression_belongs_to_work ?work.
      							?expression cdm:expression_title ?title.
    							?expression cdm:expression_uses_language <http://publications.europa.eu/resource/authority/language/ENG>.
       						?work cdm:case-law_ecli ?ecli.
       						?work cdm:resource_legal_id_celex ?celex.
							?work cdm:case-law_delivered_by_advocate-general ?ag.
                            ?ag cdm:agent_name ?agname.
      							OPTIONAL{?expression cdm:expression_case-law_parties|cdm:expression_title_alternative ?alttitle}
                                           }
       						FILTER(?class in (<http://publications.europa.eu/ontology/cdm#judgement>,<http://publications.europa.eu/ontology/cdm#opinion_cjeu>,<http://publications.europa.eu/ontology/cdm#opinion_advocate-general>))
       						FILTER ((CONTAINS (?alttitle, "
				set theQueryp2 to ") || CONTAINS(?title,"
				set theQueryp3 to "))&& CONTAINS (?ecli,"
				set theQueryp4 to "))}
                            			LIMIT 15"
				
				set theQuery to theQueryp1 & quoted form of theTitle & theQueryp2 & quoted form of theTitle & theQueryp3 & quoted form of theCiteKeyYear & theQueryp4
			end if
			--display dialog theQuery --uncomment to diagnose
			
			
			-- set shell variable to concatenated query, perform SPARQL query and remove "ECLI:" from result string
			
			set theResponse to do shell script "query=" & quoted form of theQuery & "; curl -H \"Accept:text/csv\" http://publications.europa.eu/webapi/rdf/sparql --data-urlencode \"query=$query\" | sed -E 's/ECLI://g'"
			
			--display dialog theResponse --uncomment this line to troubleshoot (or the next)
			--do shell script "echo " & theResponse & ">~/Desktop/response.txt" --uncomment this line to troubleshoot
			if theResponse is "" then
				return
			end if
			
			
			-- GET NUMBER OF QUERY RESULTS
			set NumberofResults to do shell script "awk -F, 'BEGIN{RS=\"\\r\"} NR>1 {rows++} END{print rows} '<<<" & quoted form of theResponse
			
			if NumberofResults is equal to 0 then
				display dialog "There are no results"
				return
			else
				
				-- TURN RECORDS INTO APPLESCRIPT LIST
				set oldDelimiters to AppleScript's text item delimiters
				set AppleScript's text item delimiters to {"~"}
				
				
				set theResults to every text item of (do shell script "/usr/local/bin/gawk -v FPAT='\"[^\"]+\"|[^,]*' 'BEGIN{RS=\"[\\r\\n]\";ORS=\"~\";OFS=\"\\t\"} NF==7 {split($NF, a, /\\.\\s*#\\s*/) split($2,c,\"/\")};NR!=1&&NF<=7 {print NR-1,a[length(a)],$6,$5,$3,$4,a[length(a)-1]}'<<<" & quoted form of theResponse & "| sed 's/\"//g'" & "| sed 's/\\.\\t/\\t/g'" & "| sed 's/~$//'") --remove double quotes, remove periods followed by field separator (at the end of the case number field), remove trailing record separator, put number in front of results in order to match choice from this list to expression ID from indexlist list.
				--display dialog theResults as text
				
				set IndexList to every text item of (do shell script "/usr/local/bin/awk -v FPAT='\"[^\"]+\"|[^,]*' 'BEGIN{RS=\"[\\r\\n]\";ORS=\"~\";OFS=\"\\t\"} NF==7 {split($NF, a, /\\.\\s*#\\s*/) split($2,c,\"/\")};NR!=1&&NF<=7 {print c[6]}'<<<" & quoted form of theResponse & "| sed 's/\"//g'" & "| sed 's/\\.\\t/\\t/g'" & "| sed 's/~$//'") --create a list with just the expression IDs of every record
				
				
				--do shell script "echo " & IndexList & ">~/Desktop/indexlist.txt" --uncomment for diagnostics
				
				if theResults is "" then
					display dialog "Could not parse results into a list"
					return
				else
					try
						set theChosenCase to choose from list theResults with title "Search results" with prompt "Please pick the right case. AG opinions are displayed last." OK button name "Select" cancel button name "Quit"
						if theChosenCase is false then
							return
						end if
					on error errStr number errorNumber
						if the errorNumber is equal to -50 then
							display dialog "There were no results!"
							return
						end if
					end try
				end if
				
				-- PARSE THE LIST IN THE DIALOG BOX
				try
					
					set IndexChoice to do shell script "awk -F'\\t' '{print $1}'<<<" & quoted form of (theChosenCase as text) --get the number of the choice
					
					set theExpressionID to do shell script "/usr/local/bin/awk -F~ '{print $" & IndexChoice & "}'<<<" & quoted form of (IndexList as text) --use the choice number to find the matching expression ID.
					if theCiteKeyYear contains "EU" then
						set thenewEcli to theCiteKeyYear
					else
						set thenewEcli to do shell script "awk -F'\\t' '{print $5}' <<<" & quoted form of (theChosenCase as text)
					end if
					
					set thenewCaseNo to do shell script "awk  -F'\\t' '{print $2}'<<<" & quoted form of (theChosenCase as text) & "| sed -E 's/Case |Joined cases |Joined Cases |Opinion //g'" & "| sed -E 's*([0-9])-([0-9])*\\1\\/\\2*g'" --remove "Case" and replace hyphen in old casenumber with slash
					
					if theCiteKeyYear contains "EU" then
						set AppleScript's text item delimiters to {":"}
						set thenewDate to the third text item of theCiteKeyYear
					else
						set thenewDate to do shell script "awk -F'\\t' '{split($5,b,\":\"); print b[3]}'<<<" & quoted form of (theChosenCase as text)
					end if
					set CELEX to do shell script "awk -F'\\t' '{print $6}'<<<" & quoted form of (theChosenCase as text)
					
					if CELEX contains "CJ" then
						set theType to ""
					end if
					
					if CELEX contains "CC" then -- is the case when normal AG opinion
						set theType to do shell script "awk -F'\\t' '{print \"Opinion of Advocate General \" $3 \" in\"}'<<<" & quoted form of (theChosenCase as text)
					end if
					
					if CELEX contains "CV" then -- is the case when it is a court opinion instead of judgment
						set theType to "Opinion"
					end if
					
					if CELEX contains "CP" then -- is the case when AG view instead of opinion
						set theType to do shell script "awk -F'\\t' '{print \"View of Advocate General \" $3 \" in Opinion\"}'<<<" & quoted form of (theChosenCase as text)
					end if
					
					
					
					--display dialog theAG
					--set theExpressionURI to do shell script "awk -F'\\t' '{print $6}'<<<" & quoted form of (theChosenCase as text)
				on error errStr number errorNumber
					if the errorNumber is greater than 0 then
						display dialog "Error in parsing the Case you chose"
						return
					end if
				end try
			end if
			set AppleScript's text item delimiters to oldDelimiters
			
			-- LET BIBDESK CHANGE FIELDS
			set value of field "Ecli" to thenewEcli
			set value of field "Number" to thenewCaseNo
			set value of field "Date" to thenewDate
			set value of field "Author" to ""
			set value of field "Year" to ""
			if theType is not "" then
				set value of field "Type" to theType
			end if
			
			
			--ADD PDF BASED ON CELEX
			
			set theUrl to do shell script "awk 'BEGIN{print \"https://eur-lex.europa.eu/legal-content/EN/TXT/PDF/?uri=CELEX:" & quoted form of CELEX & "&rid=1\"}'"
			add theUrl to beginning of linked URLs
			download linked URL 1 with replace
			
			-- CHECK WHETHER ATTACHED FILE IS A PDF. IF NOT, REMOVE FILE AND GO AFTER REPORT FOR THE HEARING AND JUDGMENT
			delay 3
			set theFile to POSIX path of linked file 1 as text
			set oldDelimiters to AppleScript's text item delimiters
			set AppleScript's text item delimiters to {"."}
			if theFile contains "." then -- if the attached file is not a PDF, it means there was more than one datastream (pdf)
				set theFileExtension to last text item of theFile
				if theFileExtension contains "pdf" then
					return
				else
					delete linked file 1 --delete the html
					set theExpressionURI to "http://publications.europa.eu/resource/cellar/" & theExpressionID --concatenate the expression URI 
					--display dialog theExpressionURI
					set theMultipleChoiceResponse to (do shell script "curl -H \"Accept:application/pdf\" -H \"Accept-Language:eng\" " & theExpressionURI) --get the error response from the REST API with curl
					do shell script "echo " & quoted form of theMultipleChoiceResponse & ">~/Desktop/output.txt" --uncomment for diagnostics
					set theUrl to (do shell script "awk 'BEGIN{RS=\"title=\\\"item\\\">\";FS=\"<li title=\"} NR>1 {split($1,a,\"\\\"\") split($2,b,\"/>|</\") } {sub(/\\\"stream_name\\\">/, \"\",b[1])} {if (b[1] ~ /(.+ARRET.+)|(.+AVIS.+)/) {print a[2]}}'<<<" & quoted form of theMultipleChoiceResponse as text) --parse the error response and isolate the url whose stream_name has ARRET or AVIS in it, to get the judgment/opinion pdf rather than the report of the hearing
					--display dialog theUrl -- uncomment for diagnostics
					add theUrl to beginning of linked URLs
					try
						download linked URL 1 with replace
					on error errStr number errorNumber
						if errorNumber is -1719 then
							display dialog "Could not find case URL"
							return
						else
							error errStr number errorNumber
						end if
					end try
					
				end if
			end if
			
			set AppleScript's text item delimiters to oldDelimiters
			
		end tell
	end tell
end tell