function exp = expansao(bloco)

%pega o vetor de tam 8 e transforma em matriz 2x4
original = [bloco(1:4); bloco(5:8)];
%com a primeira coluna 
first_column = original(:,1);
first_column =  [first_column(end);first_column(1)];
last_column = original(:,4);
last_column =  [last_column(end);last_column(1)];

exp = [first_column original last_column];

end