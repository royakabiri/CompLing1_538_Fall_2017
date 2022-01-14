s(s(NP,VP)) --> np(NP,P,N), vp(VP,Tag), {subjverb(P,N,Tag)}.
np(np(PRP),P,N) --> prp(PRP, P, N).
np(np(NNP), P, N) --> nnp(NNP, P, N). 
cognp(np(DT,NN), CO_N)--> dt(DT), nn(NN, CO_N).
cognp(np(DT,JJ,NN), CO_N) --> dt(DT), jj(JJ), nn(NN,CO_N).
nn(nn(CO_N), CO_N)--> [CO_N]. 
vp(vp(VP),Tag)--> coverb(VP,CO_V, Tag), {coverb(CO_V,_)}.
vp(vp(VP,NP),Tag)--> coverb(VP, CO_V, Tag), cognp(NP, CO_N), {coverb(CO_V,CO_N)}.	 
coverb(vbd(Form), CO_V, vbd) --> [Form], {verbform(CO_V,vbd, Form)}.
coverb(vbp(Form), CO_V, vbp) --> [Form], {verbform(CO_V,vbp, Form)}.
coverb(vbz(Form), CO_V, vbz) --> [Form], {verbform(CO_V,vbz, Form)}. 
dt(dt(a)) --> [a].
dt(dt(the)) --> [the].
prp(prp(i),1,sg) --> [i].
prp(prp(you),2,sg) --> [you]. 
prp(prp(you),2,pl) -->  [you]. 
prp(prp(he),3,sg) --> [he]. 
prp(prp(she),3,sg) -->  [she]. 
prp(prp(we),1,pl) -->  [we]. 
prp(prp(they),3,pl) --> [they]. 
nnp(nnp(alice), 3, sg) --> [alice].
nnp(nnp(jayce), 3, sg) --> [jayce].
jj(jj(happy))--> [happy].
jj(jj(nice))--> [nice].
jj(jj(lovely))--> [lovely].
jj(jj(terrible))--> [terrible].
coverb(fight, fight).
coverb(live, life).
coverb(dance, dance).
coverb(smile, smile).
coverb(laugh, laugh).
coverb(walk, walk).
coverb(die, death).
coverb(sleep, sleep).
coverb(talk, talk).
coverb(sing, song). 
verbform(fight, vbd, fought).
verbform(fight, vbp, fight).
verbform(fight, vbz, fights).
verbform(live, vbd, lived).
verbform(live, vbp, live).
verbform(live, vbz, lives).
verbform(dance, vbd, danced).
verbform(dance, vbp, dance).
verbform(dance, vbz, dances).
verbform(smile, vbd, smiled).
verbform(smile, vbp, smile).
verbform(smile, vbz, smiles).
verbform(laugh, vbd, laughed).
verbform(laugh, vbp, laugh).
verbform(laugh, vbz, laughs).
verbform(walk, vbd, walked).
verbform(walk, vbp, walk).
verbform(walk, vbz, walks).
verbform(die, vbd, died).
verbform(die, vbp, die).
verbform(die, vbz, dies).
verbform(sleep, vbd, slept).
verbform(sleep, vbp, sleep).
verbform(sleep, vbz, sleeps).
verbform(sing, vbd, sang).
verbform(sing, vbp, sing).
verbform(sing, vbz, sings).
verbform(talk, vbd, talked).
verbform(talk, vbp, talk).
verbform(talk, vbz, talks).
subjverb(_,_,vbd).
subjverb(3,sg,vbz).
subjverb(1,_,vbp).
subjverb(2,_,vbp).
subjverb(3,pl,vbp).
