FasdUAS 1.101.10   ��   ��    k             l     ��  ��   ��This AppleScript allows you to complete bibliographic references of EU court cases in BibDesk (macOS). It uses the information in the title field of a reference (and, if available, other information such as the ECLI number) and then searches the EU database via SPARQL for matches. It will fill out the rest of the reference in BibDesk and download the judgment, court opinion or AG opinion in PDF.      � 	 	 T h i s   A p p l e S c r i p t   a l l o w s   y o u   t o   c o m p l e t e   b i b l i o g r a p h i c   r e f e r e n c e s   o f   E U   c o u r t   c a s e s   i n   B i b D e s k   ( m a c O S ) .   I t   u s e s   t h e   i n f o r m a t i o n   i n   t h e   t i t l e   f i e l d   o f   a   r e f e r e n c e   ( a n d ,   i f   a v a i l a b l e ,   o t h e r   i n f o r m a t i o n   s u c h   a s   t h e   E C L I   n u m b e r )   a n d   t h e n   s e a r c h e s   t h e   E U   d a t a b a s e   v i a   S P A R Q L   f o r   m a t c h e s .   I t   w i l l   f i l l   o u t   t h e   r e s t   o f   t h e   r e f e r e n c e   i n   B i b D e s k   a n d   d o w n l o a d   t h e   j u d g m e n t ,   c o u r t   o p i n i o n   o r   A G   o p i n i o n   i n   P D F .     
  
 l     ��������  ��  ��        l     ��  ��   SMPrerequisites: The script assumes that you are using OSCOLA as a reference style (see the oscola biblatex package by Paul Stanley). For instance, it assumes you have fields called "Ecli" and "Number" and it will put "Opinion" (for Court opinion) or "Opinion of Advocate General [Name] in" in the Type field.  The script could quite easily be tweaked, however, to fit another reference style. The script also contains a few features that are specific to my database and so may be deleted (e.g. it checks whether there isn't already an ECLI number in the Pages field or year in the citekey).     �  � P r e r e q u i s i t e s :   T h e   s c r i p t   a s s u m e s   t h a t   y o u   a r e   u s i n g   O S C O L A   a s   a   r e f e r e n c e   s t y l e   ( s e e   t h e   o s c o l a   b i b l a t e x   p a c k a g e   b y   P a u l   S t a n l e y ) .   F o r   i n s t a n c e ,   i t   a s s u m e s   y o u   h a v e   f i e l d s   c a l l e d   " E c l i "   a n d   " N u m b e r "   a n d   i t   w i l l   p u t   " O p i n i o n "   ( f o r   C o u r t   o p i n i o n )   o r   " O p i n i o n   o f   A d v o c a t e   G e n e r a l   [ N a m e ]   i n "   i n   t h e   T y p e   f i e l d .     T h e   s c r i p t   c o u l d   q u i t e   e a s i l y   b e   t w e a k e d ,   h o w e v e r ,   t o   f i t   a n o t h e r   r e f e r e n c e   s t y l e .   T h e   s c r i p t   a l s o   c o n t a i n s   a   f e w   f e a t u r e s   t h a t   a r e   s p e c i f i c   t o   m y   d a t a b a s e   a n d   s o   m a y   b e   d e l e t e d   ( e . g .   i t   c h e c k s   w h e t h e r   t h e r e   i s n ' t   a l r e a d y   a n   E C L I   n u m b e r   i n   t h e   P a g e s   f i e l d   o r   y e a r   i n   t h e   c i t e k e y ) .      l     ��������  ��  ��        l     ��  ��     Timothy Roes (2021)     �   & T i m o t h y   R o e s   ( 2 0 2 1 )      l     ��������  ��  ��        p         ������ 0 thetitle theTitle��        l     ��������  ��  ��     ��  l   �  ����   O    � ! " ! k   � # #  $ % $ I   	������
�� .miscactvnull��� ��� null��  ��   %  & ' & r   
  ( ) ( e   
  * * 4  
 �� +
�� 
docu + m    ����  ) o      ���� 0 thedoc theDoc '  ,�� , O   � - . - k   � / /  0 1 0 l   ��������  ��  ��   1  2 3 2 r     4 5 4 l    6���� 6 1    ��
�� 
sele��  ��   5 o      ���� 0 theselection theSelection 3  7 8 7 Q    E 9 : ; 9 r    & < = < e    $ > > n    $ ? @ ? 4     #�� A
�� 
cobj A m   ! "����  @ o     ���� 0 theselection theSelection = o      ���� 0 thepub thePub : R      �� B C
�� .ascrerr ****      � **** B o      ���� 0 errstr errStr C �� D��
�� 
errn D o      ���� 0 errornumber errorNumber��   ; Z   . E E F�� G E =  . 1 H I H l  . / J���� J o   . /���� 0 errornumber errorNumber��  ��   I m   / 0�����@ F k   4 < K K  L M L I  4 9�� N��
�� .sysodlogaskr        TEXT N m   4 5 O O � P P 4 P l e a s e   s e l e c t   a   c a s e   f i r s t��   M  Q�� Q L   : <����  ��  ��   G R   ? E�� R S
�� .ascrerr ****      � **** R o   C D���� 0 errstr errStr S �� T��
�� 
errn T o   A B���� 0 errornumber errorNumber��   8  U�� U O   F� V W V k   J� X X  Y Z Y l  J J�� [ \��   [ C =GET DATA FOR SEARCH FROM REFERENCE IN BIBDESK and CLEAN IT UP    \ � ] ] z G E T   D A T A   F O R   S E A R C H   F R O M   R E F E R E N C E   I N   B I B D E S K   a n d   C L E A N   I T   U P Z  ^ _ ^ r   J V ` a ` n   J R b c b 1   N R��
�� 
fldv c 4   J N�� d
�� 
bfld d m   L M e e � f f 
 T i t l e a o      ���� 0 thetitleraw theTitleRaw _  g h g l  W r i j k i r   W r l m l l  W n n���� n I  W n�� o��
�� .sysoexecTEXT���     TEXT o b   W j p q p b   W f r s r b   W b t u t m   W Z v v � w w 4 s e d   ' s =   \ ( ( [ ^ ) ] * ) \ ) = = g ' < < < u n   Z a x y x 1   ] a��
�� 
strq y o   Z ]���� 0 thetitleraw theTitleRaw s m   b e z z � { { *   |   s e d   ' s / [ \ . { } \ ] / / g ' q m   f i | | � } } 0   |   s e d   ' s / a n d   O t h e r s / / g '��  ��  ��   m o      ���� 0 thetitle theTitle j Y Sremove (shorttitle),{}'s and \'s from title, and trailing white space, "and Others"    k � ~ ~ � r e m o v e   ( s h o r t t i t l e ) , { } ' s   a n d   \ ' s   f r o m   t i t l e ,   a n d   t r a i l i n g   w h i t e   s p a c e ,   " a n d   O t h e r s " h   �  l  s s��������  ��  ��   �  � � � Z   s � � ��� � � >  s | � � � 1   s x��
�� 
ckey � m   x { � � � � �   � k    � � �  � � � r    � � � � 1    ���
�� 
ckey � o      ���� 0 
thecitekey 
theCiteKey �  ��� � l  � � � � � � r   � � � � � I  � ��� ���
�� .sysoexecTEXT���     TEXT � b   � � � � � m   � � � � � � � z / u s r / l o c a l / b i n / a w k   - F :   ' { s u b (   / [ a - z ] + / , " " , $ 3 ) ;   p r i n t   $ 3 } '   < < < � n   � � � � � 1   � ���
�� 
strq � o   � ����� 0 
thecitekey 
theCiteKey��   � o      ����  0 thecitekeyyear theCiteKeyYear �  pull year from citekey    � � � � , p u l l   y e a r   f r o m   c i t e k e y��  ��   � l  � � � � � � r   � � � � � m   � � � � � � �  : � o      ����  0 thecitekeyyear theCiteKeyYear �   should then match any ECLI    � � � � 4 s h o u l d   t h e n   m a t c h   a n y   E C L I �  � � � l  � ���������  ��  ��   �  � � � Z   � � � ����� � E   � � � � � n   � � � � � 1   � ���
�� 
fldv � 4   � ��� �
�� 
bfld � m   � � � � � � � 
 P a g e s � m   � � � � � � �  E U : � l  � � � � � � r   � � � � � n   � � � � � 1   � ���
�� 
fldv � 4   � ��� �
�� 
bfld � m   � � � � � � � 
 p a g e s � o      ����  0 thecitekeyyear theCiteKeyYear � 2 , Get full ECLI from Pages field if avaialble    � � � � X   G e t   f u l l   E C L I   f r o m   P a g e s   f i e l d   i f   a v a i a l b l e��  ��   �  � � � l  � ���������  ��  ��   �  � � � Z   � � � ����� � E   � � � � � n   � � � � � 1   � ���
�� 
fldv � 4   � ��� �
�� 
bfld � m   � � � � � � �  e c l i � m   � � � � � � �  E U : � l  � � � � � � r   � � � � � n   � � � � � 1   � ���
�� 
fldv � 4   � ��� �
�� 
bfld � m   � � � � � � �  e c l i � o      ����  0 thecitekeyyear theCiteKeyYear � 0 *Get full ECLI from ecli field if available    � � � � T G e t   f u l l   E C L I   f r o m   e c l i   f i e l d   i f   a v a i l a b l e��  ��   �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   �  CONCATENATE SPARQL QUERY    � � � � 0 C O N C A T E N A T E   S P A R Q L   Q U E R Y �  � � � l  � ��� � ���   � : 4if there is an ECLI available, search only on ECLI.     � � � � h i f   t h e r e   i s   a n   E C L I   a v a i l a b l e ,   s e a r c h   o n l y   o n   E C L I .   �  � � � l  � ���������  ��  ��   �  � � � Z   �� � ��� � � E   � � � � � o   � �����  0 thecitekeyyear theCiteKeyYear � m   � � � � � � �  E U � k   �> � �  � � � r   � � � � b   �  � � � m   � � � � � � � 
 E C L I : � o   � �����  0 thecitekeyyear theCiteKeyYear � o      ���� 0 theecli theECLI �  � � � r   � � � m   � � � � �~ P R E F I X   c d m :   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # > 
 	 	 	 	 	 	 	 S E L E C T   D I S T I N C T   ? w o r k   ? e x p r e s s i o n   ? e c l i   ? c e l e x   ? a l t t i t l e   ? a g n a m e   ? t i t l e 
 	 	 	 	 	 	 	 W H E R E   { { 
 	 	 	 	 	 	 	 ? w o r k   a   ? c l a s s . 
               	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ b e l o n g s _ t o _ w o r k   ? w o r k . 
             	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ t i t l e   ? t i t l e . 
         	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ u s e s _ l a n g u a g e   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / r e s o u r c e / a u t h o r i t y / l a n g u a g e / E N G > . 
               	 	 	 	 	 	 ? w o r k   c d m : c a s e - l a w _ e c l i   � o      ���� 0 
thequeryp1 
theQueryp1 �  �  � r   m   �� ^ ^ < h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # s t r i n g > . 
 	 	 	 	 	 	 	 ? w o r k   c d m : r e s o u r c e _ l e g a l _ i d _ c e l e x   ? c e l e x . 
             	 	 	 	 	 	         O P T I O N A L { ? e x p r e s s i o n   c d m : e x p r e s s i o n _ c a s e - l a w _ p a r t i e s | c d m : e x p r e s s i o n _ t i t l e _ a l t e r n a t i v e   ? a l t t i t l e } } 
 	 	 	 	 	 	 	 U N I O N { ? w o r k   a   ? c l a s s . 
               	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ b e l o n g s _ t o _ w o r k   ? w o r k . 
             	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ t i t l e   ? t i t l e . 
         	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ u s e s _ l a n g u a g e   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / r e s o u r c e / a u t h o r i t y / l a n g u a g e / E N G > . 
               	 	 	 	 	 	 ? w o r k   c d m : c a s e - l a w _ e c l i   o      ���� 0 
thequeryp2 
theQueryp2   r   m  		 �

d ^ ^ < h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # s t r i n g > . 
 	 	 	 	 	 	 	 ? w o r k   c d m : r e s o u r c e _ l e g a l _ i d _ c e l e x   ? c e l e x . 
                                                                                               ? w o r k   c d m : c a s e - l a w _ d e l i v e r e d _ b y _ a d v o c a t e - g e n e r a l   ? a g . 
                                                                                                           ? a g   c d m : a g e n t _ n a m e   ? a g n a m e . 
             	 	 	 	 	 	 O P T I O N A L { ? e x p r e s s i o n   c d m : e x p r e s s i o n _ c a s e - l a w _ p a r t i e s | c d m : e x p r e s s i o n _ t i t l e _ a l t e r n a t i v e   ? a l t t i t l e } 
                                                                                                       } 
               	 	 	 	 	 	 F I L T E R ( ? c l a s s   i n   ( < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # c a s e - l a w > , < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # j u d g e m e n t > , < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # o p i n i o n _ a d v o c a t e - g e n e r a l > ) ) } 
                                                         	 	 	 L I M I T   1 5 o      ���� 0 
thequeryp3 
theQueryp3  r  < b  8 b  4 b  , b  ( o   ���� 0 
thequeryp1 
theQueryp1 n   ' 1  #'��
�� 
strq o   #���� 0 theecli theECLI o  (+���� 0 
thequeryp2 
theQueryp2 n  ,3 1  /3��
�� 
strq o  ,/���� 0 theecli theECLI o  47���� 0 
thequeryp3 
theQueryp3 o      ���� 0 thequery theQuery  l ==����~��  �  �~   �} l ==�|�|   E ?Else, search title OR alternative title AND year (within ecli).    �   ~ E l s e ,   s e a r c h   t i t l e   O R   a l t e r n a t i v e   t i t l e   A N D   y e a r   ( w i t h i n   e c l i ) .�}  ��   � k  A�!! "#" r  AH$%$ m  AD&& �''
� P R E F I X   c d m :   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # > 
 	 	 	 	 	 	 	 S E L E C T   ? w o r k   ? e x p r e s s i o n   ? e c l i   ? c e l e x   ? a l t t i t l e   ? a g n a m e   ? t i t l e 
 	 	 	 	 	 	 	 W H E R E   { { 
 	 	 	 	 	 	 	 ? w o r k   a   ? c l a s s . 
               	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ b e l o n g s _ t o _ w o r k   ? w o r k . 
             	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ t i t l e   ? t i t l e . 
         	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ u s e s _ l a n g u a g e   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / r e s o u r c e / a u t h o r i t y / l a n g u a g e / E N G > . 
               	 	 	 	 	 	 ? w o r k   c d m : c a s e - l a w _ e c l i   ? e c l i . 
               	 	 	 	 	 	 ? w o r k   c d m : r e s o u r c e _ l e g a l _ i d _ c e l e x   ? c e l e x . 
             	 	 	 	 	 	 	 O P T I O N A L { ? e x p r e s s i o n   c d m : e x p r e s s i o n _ c a s e - l a w _ p a r t i e s | c d m : e x p r e s s i o n _ t i t l e _ a l t e r n a t i v e   ? a l t t i t l e } } 
 	 	 	 	 	 	 	 U N I O N { ? w o r k   a   ? c l a s s . 
               	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ b e l o n g s _ t o _ w o r k   ? w o r k . 
             	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ t i t l e   ? t i t l e . 
         	 	 	 	 	 	 	 ? e x p r e s s i o n   c d m : e x p r e s s i o n _ u s e s _ l a n g u a g e   < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / r e s o u r c e / a u t h o r i t y / l a n g u a g e / E N G > . 
               	 	 	 	 	 	 ? w o r k   c d m : c a s e - l a w _ e c l i   ? e c l i . 
               	 	 	 	 	 	 ? w o r k   c d m : r e s o u r c e _ l e g a l _ i d _ c e l e x   ? c e l e x . 
 	 	 	 	 	 	 	 ? w o r k   c d m : c a s e - l a w _ d e l i v e r e d _ b y _ a d v o c a t e - g e n e r a l   ? a g . 
                                                         ? a g   c d m : a g e n t _ n a m e   ? a g n a m e . 
             	 	 	 	 	 	 	 O P T I O N A L { ? e x p r e s s i o n   c d m : e x p r e s s i o n _ c a s e - l a w _ p a r t i e s | c d m : e x p r e s s i o n _ t i t l e _ a l t e r n a t i v e   ? a l t t i t l e } 
                                                                                       } 
               	 	 	 	 	 	 F I L T E R ( ? c l a s s   i n   ( < h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / o n t o l o g y / c d m # j u d g e m e n t > ) ) 
               	 	 	 	 	 	 F I L T E R   ( ( C O N T A I N S   ( ? a l t t i t l e ,  % o      �{�{ 0 
thequeryp1 
theQueryp1# ()( r  IP*+* m  IL,, �-- * )   | |   C O N T A I N S ( ? t i t l e ,+ o      �z�z 0 
thequeryp2 
theQueryp2) ./. r  QX010 m  QT22 �33 * ) ) & &   C O N T A I N S   ( ? e c l i ,1 o      �y�y 0 
thequeryp3 
theQueryp3/ 454 r  Y`676 m  Y\88 �99 V ) ) } 
                                                         	 	 	 L I M I T   1 57 o      �x�x 0 
thequeryp4 
theQueryp45 :;: l aa�w�v�u�w  �v  �u  ; <�t< r  a�=>= b  a�?@? b  a�ABA b  a|CDC b  axEFE b  apGHG b  alIJI o  ad�s�s 0 
thequeryp1 
theQueryp1J n  dkKLK 1  gk�r
�r 
strqL o  dg�q�q 0 thetitle theTitleH o  lo�p�p 0 
thequeryp2 
theQueryp2F n  pwMNM 1  sw�o
�o 
strqN o  ps�n�n 0 thetitle theTitleD o  x{�m�m 0 
thequeryp3 
theQueryp3B n  |�OPO 1  ��l
�l 
strqP o  |�k�k  0 thecitekeyyear theCiteKeyYear@ o  ���j�j 0 
thequeryp4 
theQueryp4> o      �i�i 0 thequery theQuery�t   � QRQ l ���hST�h  S 5 /display dialog theQuery --uncomment to diagnose   T �UU ^ d i s p l a y   d i a l o g   t h e Q u e r y   - - u n c o m m e n t   t o   d i a g n o s eR VWV l ���g�f�e�g  �f  �e  W XYX l ���d�c�b�d  �c  �b  Y Z[Z l ���a\]�a  \ k e set shell variable to concatenated query, perform SPARQL query and remove "ECLI:" from result string   ] �^^ �   s e t   s h e l l   v a r i a b l e   t o   c o n c a t e n a t e d   q u e r y ,   p e r f o r m   S P A R Q L   q u e r y   a n d   r e m o v e   " E C L I : "   f r o m   r e s u l t   s t r i n g[ _`_ l ���`�_�^�`  �_  �^  ` aba r  ��cdc I ���]e�\
�] .sysoexecTEXT���     TEXTe b  ��fgf b  ��hih m  ��jj �kk  q u e r y =i n  ��lml 1  ���[
�[ 
strqm o  ���Z�Z 0 thequery theQueryg m  ��nn �oo ;   c u r l   - H   " A c c e p t : t e x t / c s v "   h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / w e b a p i / r d f / s p a r q l   - - d a t a - u r l e n c o d e   " q u e r y = $ q u e r y "   |   s e d   - E   ' s / E C L I : / / g '�\  d o      �Y�Y 0 theresponse theResponseb pqp l ���X�W�V�X  �W  �V  q rsr l ���Utu�U  t T Ndisplay dialog theResponse --uncomment this line to troubleshoot (or the next)   u �vv � d i s p l a y   d i a l o g   t h e R e s p o n s e   - - u n c o m m e n t   t h i s   l i n e   t o   t r o u b l e s h o o t   ( o r   t h e   n e x t )s wxw l ���Tyz�T  y m gdo shell script "echo " & theResponse & ">~/Desktop/response.txt" --uncomment this line to troubleshoot   z �{{ � d o   s h e l l   s c r i p t   " e c h o   "   &   t h e R e s p o n s e   &   " > ~ / D e s k t o p / r e s p o n s e . t x t "   - - u n c o m m e n t   t h i s   l i n e   t o   t r o u b l e s h o o tx |}| Z  ��~�S�R~ = ����� o  ���Q�Q 0 theresponse theResponse� m  ���� ���   L  ���P�P  �S  �R  } ��� l ���O�N�M�O  �N  �M  � ��� l ���L�K�J�L  �K  �J  � ��� l ���I���I  � "  GET NUMBER OF QUERY RESULTS   � ��� 8   G E T   N U M B E R   O F   Q U E R Y   R E S U L T S� ��� r  ����� I ���H��G
�H .sysoexecTEXT���     TEXT� b  ����� m  ���� ��� t a w k   - F ,   ' B E G I N { R S = " \ r " }   N R > 1   { r o w s + + }   E N D { p r i n t   r o w s }   ' < < <� n  ����� 1  ���F
�F 
strq� o  ���E�E 0 theresponse theResponse�G  � o      �D�D "0 numberofresults NumberofResults� ��� l ���C�B�A�C  �B  �A  � ��� Z  �����@�� = ����� o  ���?�? "0 numberofresults NumberofResults� m  ���>�>  � k  ���� ��� I ���=��<
�= .sysodlogaskr        TEXT� m  ���� ��� ( T h e r e   a r e   n o   r e s u l t s�<  � ��;� L  ���:�:  �;  �@  � k  ���� ��� l ���9�8�7�9  �8  �7  � ��� l ���6���6  � ) # TURN RECORDS INTO APPLESCRIPT LIST   � ��� F   T U R N   R E C O R D S   I N T O   A P P L E S C R I P T   L I S T� ��� r  ����� n ����� 1  ���5
�5 
txdl� 1  ���4
�4 
ascr� o      �3�3 0 olddelimiters oldDelimiters� ��� r  ����� J  ���� ��2� m  ���� ���  ~�2  � n     ��� 1  ���1
�1 
txdl� 1  ���0
�0 
ascr� ��� l ���/�.�-�/  �.  �-  � ��� l ���,�+�*�,  �+  �*  � ��� l ����� r  ���� n  ���� 2  �)
�) 
citm� l ���(�'� I ��&��%
�& .sysoexecTEXT���     TEXT� b  ���� b  ���� b  ���� b  ���� m  ���� ���� / u s r / l o c a l / b i n / g a w k   - v   F P A T = ' " [ ^ " ] + " | [ ^ , ] * '   ' B E G I N { R S = " [ \ r \ n ] " ; O R S = " ~ " ; O F S = " \ t " }   N F = = 7   { s p l i t ( $ N F ,   a ,   / \ . \ s * # \ s * / )   s p l i t ( $ 2 , c , " / " ) } ; N R ! = 1 & & N F < = 7   { p r i n t   N R - 1 , a [ l e n g t h ( a ) ] , $ 6 , $ 5 , $ 3 , $ 4 , a [ l e n g t h ( a ) - 1 ] } ' < < <� n  ���� 1  ��$
�$ 
strq� o  ���#�# 0 theresponse theResponse� m  �� ���  |   s e d   ' s / " / / g '� m  �� ��� & |   s e d   ' s / \ . \ t / \ t / g '� m  �� ���  |   s e d   ' s / ~ $ / / '�%  �(  �'  � o      �"�" 0 
theresults 
theResults� � �remove double quotes, remove periods followed by field separator (at the end of the case number field), remove trailing record separator, put number in front of results in order to match choice from this list to expression ID from indexlist list.   � ���� r e m o v e   d o u b l e   q u o t e s ,   r e m o v e   p e r i o d s   f o l l o w e d   b y   f i e l d   s e p a r a t o r   ( a t   t h e   e n d   o f   t h e   c a s e   n u m b e r   f i e l d ) ,   r e m o v e   t r a i l i n g   r e c o r d   s e p a r a t o r ,   p u t   n u m b e r   i n   f r o n t   o f   r e s u l t s   i n   o r d e r   t o   m a t c h   c h o i c e   f r o m   t h i s   l i s t   t o   e x p r e s s i o n   I D   f r o m   i n d e x l i s t   l i s t .� ��� l �!���!  � ' !display dialog theResults as text   � ��� B d i s p l a y   d i a l o g   t h e R e s u l t s   a s   t e x t� ��� l � ���   �  �  � ��� l @���� r  @��� n  <��� 2  8<�
� 
citm� l 8���� I 8���
� .sysoexecTEXT���     TEXT� b  4��� b  0��� b  ,��� b  (��� m   �� ���@ / u s r / l o c a l / b i n / a w k   - v   F P A T = ' " [ ^ " ] + " | [ ^ , ] * '   ' B E G I N { R S = " [ \ r \ n ] " ; O R S = " ~ " ; O F S = " \ t " }   N F = = 7   { s p l i t ( $ N F ,   a ,   / \ . \ s * # \ s * / )   s p l i t ( $ 2 , c , " / " ) } ; N R ! = 1 & & N F < = 7   { p r i n t   c [ 6 ] } ' < < <� n   '��� 1  #'�
� 
strq� o   #�� 0 theresponse theResponse� m  (+   �  |   s e d   ' s / " / / g '� m  ,/ � & |   s e d   ' s / \ . \ t / \ t / g '� m  03 �  |   s e d   ' s / ~ $ / / '�  �  �  � o      �� 0 	indexlist 	IndexList� @ :create a list with just the expression IDs of every record   � � t c r e a t e   a   l i s t   w i t h   j u s t   t h e   e x p r e s s i o n   I D s   o f   e v e r y   r e c o r d�  l AA����  �  �   	
	 l AA����  �  �  
  l AA��   b \do shell script "echo " & IndexList & ">~/Desktop/indexlist.txt" --uncomment for diagnostics    � � d o   s h e l l   s c r i p t   " e c h o   "   &   I n d e x L i s t   &   " > ~ / D e s k t o p / i n d e x l i s t . t x t "   - - u n c o m m e n t   f o r   d i a g n o s t i c s  l AA����  �  �    Z  A�� = AH o  AD�
�
 0 
theresults 
theResults m  DG �   k  KU  I KR�	�
�	 .sysodlogaskr        TEXT m  KN �   F C o u l d   n o t   p a r s e   r e s u l t s   i n t o   a   l i s t�   !�! L  SU��  �  �   Q  X�"#$" k  [�%% &'& r  [�()( I [|�*+
� .gtqpchltns    @   @ ns  * o  [^�� 0 
theresults 
theResults+ �,-
� 
appr, m  ad.. �//  S e a r c h   r e s u l t s- �01
� 
prmp0 m  gj22 �33 v P l e a s e   p i c k   t h e   r i g h t   c a s e .   A G   o p i n i o n s   a r e   d i s p l a y e d   l a s t .1 �45
� 
okbt4 m  mp66 �77  S e l e c t5 � 8��
�  
cnbt8 m  sv99 �::  Q u i t��  ) o      ���� 0 thechosencase theChosenCase' ;��; Z  ��<=����< = ��>?> o  ������ 0 thechosencase theChosenCase? m  ����
�� boovfals= L  ������  ��  ��  ��  # R      ��@A
�� .ascrerr ****      � ****@ o      ���� 0 errstr errStrA ��B��
�� 
errnB o      ���� 0 errornumber errorNumber��  $ Z  ��CD����C = ��EFE l ��G����G o  ������ 0 errornumber errorNumber��  ��  F m  ��������D k  ��HH IJI I ����K��
�� .sysodlogaskr        TEXTK m  ��LL �MM , T h e r e   w e r e   n o   r e s u l t s !��  J N��N L  ������  ��  ��  ��   OPO l ����������  ��  ��  P QRQ l ����ST��  S ' ! PARSE THE LIST IN THE DIALOG BOX   T �UU B   P A R S E   T H E   L I S T   I N   T H E   D I A L O G   B O XR V��V Q  ��WXYW k  ��ZZ [\[ l ����������  ��  ��  \ ]^] l ��_`a_ r  ��bcb I ����d��
�� .sysoexecTEXT���     TEXTd b  ��efe m  ��gg �hh 4 a w k   - F ' \ t '   ' { p r i n t   $ 1 } ' < < <f n  ��iji 1  ����
�� 
strqj l ��k����k c  ��lml o  ������ 0 thechosencase theChosenCasem m  ����
�� 
ctxt��  ��  ��  c o      ���� 0 indexchoice IndexChoice` " get the number of the choice   a �nn 8 g e t   t h e   n u m b e r   o f   t h e   c h o i c e^ opo l ����������  ��  ��  p qrq l ��stus r  ��vwv I ����x��
�� .sysoexecTEXT���     TEXTx b  ��yzy b  ��{|{ b  ��}~} m  �� ��� @ / u s r / l o c a l / b i n / a w k   - F ~   ' { p r i n t   $~ o  ������ 0 indexchoice IndexChoice| m  ���� ��� 
 } ' < < <z n  ����� 1  ����
�� 
strq� l �������� c  ����� o  ������ 0 	indexlist 	IndexList� m  ����
�� 
ctxt��  ��  ��  w o      ���� "0 theexpressionid theExpressionIDt ? 9use the choice number to find the matching expression ID.   u ��� r u s e   t h e   c h o i c e   n u m b e r   t o   f i n d   t h e   m a t c h i n g   e x p r e s s i o n   I D .r ��� Z  ������� E  ����� o  ������  0 thecitekeyyear theCiteKeyYear� m  ���� ���  E U� r  ����� o  ������  0 thecitekeyyear theCiteKeyYear� o      ���� 0 
thenewecli 
thenewEcli��  � r  ���� I ������
�� .sysoexecTEXT���     TEXT� b  ���� m  � �� ��� 6 a w k   - F ' \ t '   ' { p r i n t   $ 5 } '   < < <� n   ��� 1  ��
�� 
strq� l  ������ c   ��� o   ���� 0 thechosencase theChosenCase� m  ��
�� 
ctxt��  ��  ��  � o      ���� 0 
thenewecli 
thenewEcli� ��� l ��������  ��  ��  � ��� l 4���� r  4��� I 0�����
�� .sysoexecTEXT���     TEXT� b  ,��� b  (��� b  $��� m  �� ��� 6 a w k     - F ' \ t '   ' { p r i n t   $ 2 } ' < < <� n  #��� 1  #��
�� 
strq� l ������ c  ��� o  ���� 0 thechosencase theChosenCase� m  ��
�� 
ctxt��  ��  � m  $'�� ��� t |   s e d   - E   ' s / C a s e   | J o i n e d   c a s e s   | J o i n e d   C a s e s   | O p i n i o n   / / g '� m  (+�� ��� J |   s e d   - E   ' s * ( [ 0 - 9 ] ) - ( [ 0 - 9 ] ) * \ 1 \ / \ 2 * g '��  � o      ���� 0 thenewcaseno thenewCaseNo� C =remove "Case" and replace hyphen in old casenumber with slash   � ��� z r e m o v e   " C a s e "   a n d   r e p l a c e   h y p h e n   i n   o l d   c a s e n u m b e r   w i t h   s l a s h� ��� l 55��������  ��  ��  � ��� Z  5s������ E  5<��� o  58����  0 thecitekeyyear theCiteKeyYear� m  8;�� ���  E U� k  ?Y�� ��� r  ?L��� J  ?D�� ���� m  ?B�� ���  :��  � n     ��� 1  GK��
�� 
txdl� 1  DG��
�� 
ascr� ���� r  MY��� l MU������ n  MU��� 4 PU���
�� 
citm� m  ST���� � o  MP����  0 thecitekeyyear theCiteKeyYear��  ��  � o      ���� 0 
thenewdate 
thenewDate��  ��  � r  \s��� I \o�����
�� .sysoexecTEXT���     TEXT� b  \k��� m  \_�� ��� Z a w k   - F ' \ t '   ' { s p l i t ( $ 5 , b , " : " ) ;   p r i n t   b [ 3 ] } ' < < <� n  _j��� 1  fj��
�� 
strq� l _f������ c  _f��� o  _b���� 0 thechosencase theChosenCase� m  be��
�� 
ctxt��  ��  ��  � o      ���� 0 
thenewdate 
thenewDate� ��� r  t���� I t������
�� .sysoexecTEXT���     TEXT� b  t���� m  tw�� ��� 4 a w k   - F ' \ t '   ' { p r i n t   $ 6 } ' < < <� n  w���� 1  ~���
�� 
strq� l w~������ c  w~��� o  wz���� 0 thechosencase theChosenCase� m  z}��
�� 
ctxt��  ��  ��  � o      ���� 0 celex CELEX� ��� l ����������  ��  ��  � ��� r  ����� l �������� I �������
�� .sysoexecTEXT���     TEXT� b  ����� m  ���� ��� 4 a w k   - F ' \ t '   ' { p r i n t   $ 3 } ' < < <� n  ��� � 1  ����
�� 
strq  l ������ c  �� o  ������ 0 thechosencase theChosenCase m  ����
�� 
ctxt��  ��  ��  ��  ��  � o      ���� 0 theag theAG�  l ������    display dialog theAG    � ( d i s p l a y   d i a l o g   t h e A G 	
	 Z  ������ > �� o  ������ 0 theag theAG m  �� �   k  ��  l ����������  ��  ��   �� r  �� I ������
�� .sysoexecTEXT���     TEXT b  �� m  �� � ~ a w k   - F ' \ t '   ' { p r i n t   " O p i n i o n   o f   A d v o c a t e   G e n e r a l   "   $ 3   "   i n " } ' < < < n  �� 1  ���
� 
strq l ���~�} c  ��  o  ���|�| 0 thechosencase theChosenCase  m  ���{
�{ 
ctxt�~  �}  ��   o      �z�z 0 theag theAG��  ��  ��  
 !"! l ���y#$�y  #  display dialog theAG   $ �%% ( d i s p l a y   d i a l o g   t h e A G" &�x& l ���w'(�w  ' t nset theExpressionURI to do shell script "awk -F'\\t' '{print $6}'<<<" & quoted form of (theChosenCase as text)   ( �)) � s e t   t h e E x p r e s s i o n U R I   t o   d o   s h e l l   s c r i p t   " a w k   - F ' \ \ t '   ' { p r i n t   $ 6 } ' < < < "   &   q u o t e d   f o r m   o f   ( t h e C h o s e n C a s e   a s   t e x t )�x  X R      �v*+
�v .ascrerr ****      � ***** o      �u�u 0 errstr errStr+ �t,�s
�t 
errn, o      �r�r 0 errornumber errorNumber�s  Y Z  ��-.�q�p- ? ��/0/ l ��1�o�n1 o  ���m�m 0 errornumber errorNumber�o  �n  0 m  ���l�l  . k  ��22 343 I ���k5�j
�k .sysodlogaskr        TEXT5 m  ��66 �77 F E r r o r   i n   p a r s i n g   t h e   C a s e   y o u   c h o s e�j  4 8�i8 L  ���h�h  �i  �q  �p  ��  � 9:9 r  ��;<; o  ���g�g 0 olddelimiters oldDelimiters< n     =>= 1  ���f
�f 
txdl> 1  ���e
�e 
ascr: ?@? l ���d�c�b�d  �c  �b  @ ABA l ���aCD�a  C    LET BIBDESK CHANGE FIELDS   D �EE 4   L E T   B I B D E S K   C H A N G E   F I E L D SB FGF r  �HIH o  ���`�` 0 
thenewecli 
thenewEcliI n      JKJ 1  ��_
�_ 
fldvK 4  ���^L
�^ 
bfldL m  ��MM �NN  E c l iG OPO r  QRQ o  �]�] 0 thenewcaseno thenewCaseNoR n      STS 1  �\
�\ 
fldvT 4  �[U
�[ 
bfldU m  VV �WW  N u m b e rP XYX r   Z[Z o  �Z�Z 0 
thenewdate 
thenewDate[ n      \]\ 1  �Y
�Y 
fldv] 4  �X^
�X 
bfld^ m  __ �``  D a t eY aba r  !/cdc m  !$ee �ff  d n      ghg 1  *.�W
�W 
fldvh 4  $*�Vi
�V 
bfldi m  &)jj �kk  A u t h o rb lml r  0>non m  03pp �qq  o n      rsr 1  9=�U
�U 
fldvs 4  39�Tt
�T 
bfldt m  58uu �vv  Y e a rm wxw r  ?Myzy o  ?B�S�S 0 theag theAGz n      {|{ 1  HL�R
�R 
fldv| 4  BH�Q}
�Q 
bfld} m  DG~~ �  T y p ex ��� l NN�P�O�N�P  �O  �N  � ��� l NN�M���M  �  ADD PDF BASED ON CELEX   � ��� , A D D   P D F   B A S E D   O N   C E L E X� ��� l NN�L�K�J�L  �K  �J  � ��� r  Ne��� I Na�I��H
�I .sysoexecTEXT���     TEXT� b  N]��� b  NY��� m  NQ�� ��� � a w k   ' B E G I N { p r i n t   " h t t p s : / / e u r - l e x . e u r o p a . e u / l e g a l - c o n t e n t / E N / T X T / P D F / ? u r i = C E L E X :� n  QX��� 1  TX�G
�G 
strq� o  QT�F�F 0 celex CELEX� m  Y\�� ���  & r i d = 1 " } '�H  � o      �E�E 0 theurl theUrl� ��� I fv�D��
�D .BDSKAdd null���     ****� o  fi�C�C 0 theurl theUrl� �B��A
�B 
insh� n  lr���  :  qr� 2 lq�@
�@ 
URL �A  � ��� I w��?��
�? .BDSKDnldnull���     obj � 4  w}�>�
�> 
URL � m  {|�=�= � �<��;
�< 
Repl� m  ���:
�: boovtrue�;  � ��� l ���9�8�7�9  �8  �7  � ��� l ���6���6  � q k CHECK WHETHER ATTACHED FILE IS A PDF. IF NOT, REMOVE FILE AND GO AFTER REPORT FOR THE HEARING AND JUDGMENT   � ��� �   C H E C K   W H E T H E R   A T T A C H E D   F I L E   I S   A   P D F .   I F   N O T ,   R E M O V E   F I L E   A N D   G O   A F T E R   R E P O R T   F O R   T H E   H E A R I N G   A N D   J U D G M E N T� ��� I ���5��4
�5 .sysodelanull��� ��� nmbr� m  ���3�3 �4  � ��� r  ����� c  ����� n  ����� 1  ���2
�2 
psxp� 4  ���1�
�1 
File� m  ���0�0 � m  ���/
�/ 
ctxt� o      �.�. 0 thefile theFile� ��� r  ����� n ����� 1  ���-
�- 
txdl� 1  ���,
�, 
ascr� o      �+�+ 0 olddelimiters oldDelimiters� ��� r  ����� J  ���� ��*� m  ���� ���  .�*  � n     ��� 1  ���)
�) 
txdl� 1  ���(
�( 
ascr� ��� Z  ����'�&� E  ����� o  ���%�% 0 thefile theFile� m  ���� ���  .� l �{���� k  �{�� ��� r  ����� n  ����� 4 ���$�
�$ 
citm� m  ���#�#��� o  ���"�" 0 thefile theFile� o      �!�! $0 thefileextension theFileExtension� �� � Z  �{����� E  ����� o  ���� $0 thefileextension theFileExtension� m  ���� ���  p d f� L  ����  �  � k  �{�� ��� l ������ I �����
� .coredelonull���     obj � 4  ����
� 
File� m  ���� �  �  delete the html   � ���  d e l e t e   t h e   h t m l� ��� l ������ r  ����� b  ����� m  ���� ��� \ h t t p : / / p u b l i c a t i o n s . e u r o p a . e u / r e s o u r c e / c e l l a r /� o  ���� "0 theexpressionid theExpressionID� o      �� $0 theexpressionuri theExpressionURI� % concatenate the expression URI    � ��� > c o n c a t e n a t e   t h e   e x p r e s s i o n   U R I  � ��� l ������  � % display dialog theExpressionURI   � ��� > d i s p l a y   d i a l o g   t h e E x p r e s s i o n U R I� ��� l �� � r  � l ��� I ���
� .sysoexecTEXT���     TEXT b  �� m  �� �		 t c u r l   - H   " A c c e p t : a p p l i c a t i o n / p d f "   - H   " A c c e p t - L a n g u a g e : e n g "   o  ���� $0 theexpressionuri theExpressionURI�  �  �   o      �� 60 themultiplechoiceresponse theMultipleChoiceResponse  8 2get the error response from the REST API with curl    �

 d g e t   t h e   e r r o r   r e s p o n s e   f r o m   t h e   R E S T   A P I   w i t h   c u r l�  l  I ��
� .sysoexecTEXT���     TEXT b   b   m  	 � 
 e c h o   n  	 1  �
� 
strq o  	�� 60 themultiplechoiceresponse theMultipleChoiceResponse m   � * > ~ / D e s k t o p / o u t p u t . t x t�    uncomment for diagnostics    � 2 u n c o m m e n t   f o r   d i a g n o s t i c s  l 3  r  3!"! l /#��
# I /�	$%
�	 .sysoexecTEXT���     TEXT$ b  %&'& m  (( �))p a w k   ' B E G I N { R S = " t i t l e = \ " i t e m \ " > " ; F S = " < l i   t i t l e = " }   N R > 1   { s p l i t ( $ 1 , a , " \ " " )   s p l i t ( $ 2 , b , " / > | < / " )   }   { s u b ( / \ " s t r e a m _ n a m e \ " > / ,   " " , b [ 1 ] ) }   { i f   ( b [ 1 ]   ~   / ( . + A R R E T . + ) | ( . + A V I S . + ) / )   { p r i n t   a [ 2 ] } } ' < < <' n  $*+* 1   $�
� 
strq+ o   �� 60 themultiplechoiceresponse theMultipleChoiceResponse% �,�
� 
rtyp, m  (+�
� 
ctxt�  �  �
  " o      �� 0 theurl theUrl � �parse the error response and isolate the url whose stream_name has ARRET or AVIS in it, to get the judgment/opinion pdf rather than the report of the hearing     �--: p a r s e   t h e   e r r o r   r e s p o n s e   a n d   i s o l a t e   t h e   u r l   w h o s e   s t r e a m _ n a m e   h a s   A R R E T   o r   A V I S   i n   i t ,   t o   g e t   t h e   j u d g m e n t / o p i n i o n   p d f   r a t h e r   t h a n   t h e   r e p o r t   o f   t h e   h e a r i n g ./. l 44�01�  0 8 2display dialog theUrl -- uncomment for diagnostics   1 �22 d d i s p l a y   d i a l o g   t h e U r l   - -   u n c o m m e n t   f o r   d i a g n o s t i c s/ 343 I 4D�56
� .BDSKAdd null���     ****5 o  47� �  0 theurl theUrl6 ��7��
�� 
insh7 n  :@898  :  ?@9 2 :?��
�� 
URL ��  4 :;: Q  Ey<=>< I HV��?@
�� .BDSKDnldnull���     obj ? 4  HN��A
�� 
URL A m  LM���� @ ��B��
�� 
ReplB m  QR��
�� boovtrue��  = R      ��CD
�� .ascrerr ****      � ****C o      ���� 0 errstr errStrD ��E��
�� 
errnE o      ���� 0 errornumber errorNumber��  > Z  ^yFG��HF = ^cIJI o  ^_���� 0 errornumber errorNumberJ m  _b�����IG k  fpKK LML I fm��N��
�� .sysodlogaskr        TEXTN m  fiOO �PP . C o u l d   n o t   f i n d   c a s e   U R L��  M Q��Q L  np����  ��  ��  H R  sy��RS
�� .ascrerr ****      � ****R o  wx���� 0 errstr errStrS ��T��
�� 
errnT o  uv���� 0 errornumber errorNumber��  ; U��U l zz��������  ��  ��  ��  �   � [ U if the attached file is not a PDF, it means there was more than one datastream (pdf)   � �VV �   i f   t h e   a t t a c h e d   f i l e   i s   n o t   a   P D F ,   i t   m e a n s   t h e r e   w a s   m o r e   t h a n   o n e   d a t a s t r e a m   ( p d f )�'  �&  � WXW l ����������  ��  ��  X YZY r  ��[\[ o  ������ 0 olddelimiters oldDelimiters\ n     ]^] 1  ����
�� 
txdl^ 1  ����
�� 
ascrZ _��_ l ����������  ��  ��  ��   W o   F G���� 0 thepub thePub��   . o    ���� 0 thedoc theDoc��   " m     ``�                                                                                  BDSK  alis    &  Macintosh HD                   BD ����BibDesk.app                                                    ����            ����  
 cu             Applications  /:Applications:BibDesk.app/     B i b D e s k . a p p    M a c i n t o s h   H D  Applications/BibDesk.app  / ��  ��  ��  ��       ��ab��  a ��
�� .aevtoappnull  �   � ****b ��c����de��
�� .aevtoappnull  �   � ****c k    �ff  ����  ��  ��  d ������ 0 errstr errStr�� 0 errornumber errorNumbere �`����������������g�� O������ e���� v�� z |������ ��� ��� � � � � � � � � ��� �����	����&,28��jn����������������������� ����.��2��6��9��������Lg���������������������������6MV_ejpu~����������������������������������(����O
�� .miscactvnull��� ��� null
�� 
docu�� 0 thedoc theDoc
�� 
sele�� 0 theselection theSelection
�� 
cobj�� 0 thepub thePub�� 0 errstr errStrg ������
�� 
errn�� 0 errornumber errorNumber��  ���@
�� .sysodlogaskr        TEXT
�� 
errn
�� 
bfld
�� 
fldv�� 0 thetitleraw theTitleRaw
�� 
strq
�� .sysoexecTEXT���     TEXT�� 0 thetitle theTitle
�� 
ckey�� 0 
thecitekey 
theCiteKey��  0 thecitekeyyear theCiteKeyYear�� 0 theecli theECLI�� 0 
thequeryp1 
theQueryp1�� 0 
thequeryp2 
theQueryp2�� 0 
thequeryp3 
theQueryp3�� 0 thequery theQuery�� 0 
thequeryp4 
theQueryp4�� 0 theresponse theResponse�� "0 numberofresults NumberofResults
�� 
ascr
�� 
txdl�� 0 olddelimiters oldDelimiters
�� 
citm�� 0 
theresults 
theResults�� 0 	indexlist 	IndexList
�� 
appr
�� 
prmp
�� 
okbt
�� 
cnbt�� 
�� .gtqpchltns    @   @ ns  �� 0 thechosencase theChosenCase����
�� 
ctxt�� 0 indexchoice IndexChoice�� "0 theexpressionid theExpressionID�� 0 
thenewecli 
thenewEcli�� 0 thenewcaseno thenewCaseNo�� 0 
thenewdate 
thenewDate�� 0 celex CELEX�� 0 theag theAG�� 0 theurl theUrl
�� 
insh
�� 
URL 
�� .BDSKAdd null���     ****
�� 
Repl
�� .BDSKDnldnull���     obj 
�� .sysodelanull��� ��� nmbr
�� 
File
�� 
psxp�� 0 thefile theFile�� $0 thefileextension theFileExtension
�� .coredelonull���     obj �� $0 theexpressionuri theExpressionURI�� 60 themultiplechoiceresponse theMultipleChoiceResponse
�� 
rtyp���I�����*j O*�k/EE�O�z*�,E�O ��k/EE�W X  	��  �j OhY )��l�O�E*��/a ,E` Oa _ a ,%a %a %j E` O*a ,a  "*a ,E` Oa _ a ,%j E` Y 	a E` O*�a /a ,a  *�a  /a ,E` Y hO*�a !/a ,a " *�a #/a ,E` Y hO_ a $ Ja %_ %E` &Oa 'E` (Oa )E` *Oa +E` ,O_ (_ &a ,%_ *%_ &a ,%_ ,%E` -OPY Ma .E` (Oa /E` *Oa 0E` ,Oa 1E` 2O_ (_ a ,%_ *%_ a ,%_ ,%_ a ,%_ 2%E` -Oa 3_ -a ,%a 4%j E` 5O_ 5a 6  hY hOa 7_ 5a ,%j E` 8O_ 8j  a 9j OhY
_ :a ;,E` <Oa =kv_ :a ;,FOa >_ 5a ,%a ?%a @%a A%j a B-E` COa D_ 5a ,%a E%a F%a G%j a B-E` HO_ Ca I  a Jj OhY W 9_ Ca Ka La Ma Na Oa Pa Qa Ra S TE` UO_ Uf  hY hW X  	�a V  a Wj OhY hOa X_ Ua Y&a ,%j E` ZOa [_ Z%a \%_ Ha Y&a ,%j E` ]O_ a ^ _ E` _Y a `_ Ua Y&a ,%j E` _Oa a_ Ua Y&a ,%a b%a c%j E` dO_ a e a fkv_ :a ;,FO_ a Bm/E` gY a h_ Ua Y&a ,%j E` gOa i_ Ua Y&a ,%j E` jOa k_ Ua Y&a ,%j E` lO_ la m a n_ Ua Y&a ,%j E` lY hOPW X  	�j a oj OhY hO_ <_ :a ;,FO_ _*�a p/a ,FO_ d*�a q/a ,FO_ g*�a r/a ,FOa s*�a t/a ,FOa u*�a v/a ,FO_ l*�a w/a ,FOa x_ ja ,%a y%j E` zO_ za {*a |-5l }O*a |k/a ~el Omj �O*a �k/a �,a Y&E` �O_ :a ;,E` <Oa �kv_ :a ;,FO_ �a � �_ �a Bi/E` �O_ �a � hY �*a �k/j �Oa �_ ]%E` �Oa �_ �%j E` �Oa �_ �a ,%a �%j Oa �_ �a ,%a �a Yl E` zO_ za {*a |-5l }O *a |k/a ~el W "X  	�a �  a �j OhY )��l�OPY hO_ <_ :a ;,FOPUUUascr  ��ޭ