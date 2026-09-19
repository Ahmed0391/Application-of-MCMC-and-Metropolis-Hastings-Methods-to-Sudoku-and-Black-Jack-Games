function nouvGrille= genererNouvGrille(grille)
  nouvGrille=grille
  nouvGrille=initialisationGrille(nouvGrille,grille)
  C=nouvGrille
  i=randi(3)
  j=randi(3)
  A=grille(i*3-2:i*3,j*3-2:j*3)
  [a,b]=find(A==0)
  V=randperm(size(a,1),2)
  x=V(1)
  y=V(2)
  h=nouvGrille(a(x)+i*3-3,b(x)+j*3-3)
  nouvGrille(a(x)+i*3-3,b(x)+j*3-3)=nouvGrille(a(y)+i*3-3,b(y)+j*3-3)
  nouvGrille(a(y)+i*3-3,b(y)+j*3-3)=h
