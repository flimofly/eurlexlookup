# eurlexlookup
AppleScript to complete bibliographic references of EU court cases in BibDesk

The script uses the information in the title field of a reference (and, if available, other information such as the ECLI number) and then searches the EU database via SPARQL for matches. It will fill out the rest of the reference in BibDesk and download the judgment, court opinion or AG opinion in PDF. 

Prerequisites: 
The script assumes that you are using OSCOLA as a reference style (see the oscola biblatex package by Paul Stanley). For instance, it assumes you have fields called "Ecli" and "Number" and it will put "Opinion" (for Court opinion) or "Opinion of Advocate General [Name] in" in the Type field.  The script could quite easily be tweaked, however, to fit another reference style. The script also contains a few features that are specific to my database and so may be deleted (e.g. it checks whether there isn't already an ECLI number in the Pages field and it tries to pull the year from the citekey, which looks like this: ECJ:CaseName:YEARabc).

Tips to ensure match: 
Unlike judgments, Court opinions don't have clear titles and so are not easy to retrieve. Putting e.g. "Opinion 2/91" in the title field should work. That title will subsequently have to be amended manually (to "ILO Convention", say) because the script will already put "2/91" in the number field.

Timothy Roes (2021)
