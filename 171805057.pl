
%Furkan Gumrukcu 171805057

%Attila, s�ratle adamlar� ikiye b�ld�
%�iftli�e uzanan bir millik, �am a�a�lar�yla �r�l� yolun iki yan�ndaki �orak araziye yay�ld�lar
%Yaz g�ne�i ortal��� adeta kavuruyordu
%Kuzey do�uya do�ru uzanan arazi boyunca s�ratle ko�tular
%Evin kapkara kesilmi� iskeletinin yan�na vard�klar�nda g�rd�kleri manzaraya inanamam��lard�


%States
initial(q0).
final(q1).
final(q2).
final(q3).
final(q4).
final(q5).
final(q6).
final(q7).


%Transitions
t(q0,kok,q1).
t(q0,kok,q3).
t(q0,kok,q5).
t(q1,ses_turemesi,q2).
t(q1,yapim_eki,q3).
t(q2,yapim_eki,q3).
t(q2,zaman_eki,q5).
t(q3,olumsuzluk_eki,q4).
t(q3,yapim_eki,q5).
t(q4,zaman_eki,q5).
t(q5,zaman_eki,q6).
t(q5,kisi_eki,q6).
t(q6,kisi_eki,q7).
t(q6,zaman_eki,q7).


%Fiil k�kleri ve ekleri
allomorph(b�l,kok).
allomorph(yay,kok).
allomorph(kavur,kok).
allomorph(ko�,kok).
allomorph(inan,kok).

allomorph(u,ses_turemesi).

allomorph(�l,yapim_eki).
allomorph(a,yapim_eki).
   		
allomorph(ma,olumsuzluk_eki).

allomorph(d�,zaman_eki).
allomorph(du,zaman_eki).
allomorph(d�,zaman_eki).
allomorph(yor,zaman_eki).
allomorph(tu,zaman_eki).
allomorph(m��,zaman_eki).     

allomorph(lar,kisi_eki).



parser(String,List_of_Morphemes):-
   initial(State),
   parser(String,State,List_of_Morphemes).

parser('',State,[]):- final(State).

parser(String,CurrentState,[Morpheme|Morphemes]):-
   concat(Prefix,Suffix,String),
   allomorph(Prefix,Morpheme),
   t(CurrentState,Morpheme,NextState),
   parser(Suffix,NextState,Morphemes).
