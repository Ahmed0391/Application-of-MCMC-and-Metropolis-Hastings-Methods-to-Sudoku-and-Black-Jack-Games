A = [0 0 0 0 1 0 0 3 0;
     6 8 2 0 0 3 4 9 1;
     0 4 3 9 0 8 0 7 0;
     2 1 5 3 8 6 0 4 9;
     3 0 4 5 7 2 0 0 0;
     7 6 0 1 0 0 2 5 3;
     4 2 0 8 9 1 3 6 0;
     8 3 1 4 0 0 9 2 0;
     9 0 0 2 0 7 1 0 4];

ind=A;
grille=A;
grille=initialisationGrille(grille,ind)
nouvGrille=genererNouvGrille(A)

E(A)
critere(nouvGrille)
