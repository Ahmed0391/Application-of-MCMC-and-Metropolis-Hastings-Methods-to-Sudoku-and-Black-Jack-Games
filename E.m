function Energie=E(grille)
  Energie=0

  ml = 0; % Missing in rows
  mc = 0; % Missing in columns
  m  = 0; % Missing in 3x3 blocks
  for i = 1:9
    a=grille(i,:)
    valuesl=setdiff(1:9,a)
    ml=ml+9-size(valuesl,2)
  end

  for j= 1:9
    b=grille(:,j)
    valuesc=setdiff(1:9,b)
    mc=mc+9-size(valuesc,2)
  end

  s=1
  while (s<=9)
    d=1
    while (d<=9)
      A=grille(s:s+2,d:d+2)
      Values=setdiff(1:9,A)
      m=m+9-size(Values,2)
      d=d+3
    endwhile
    s=s+3
  endwhile

  Energie=9*9*3-ml-mc-m
