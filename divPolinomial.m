function [resto quociente] = divPolinomial(a,b)

a = reduzPolinomial(a);
b = reduzPolinomial(b);

nA = length(a);
nB = length(b);

quociente = zeros(1,max(nA-nB+1,1));
resto = a;

while length(resto) >= length(b)
q = zeros(1,max(nA-nB+1,1));
q(length(resto)-length(b)+1) = resto(end)/b(end);
quociente = quociente + q;
resto = somaPolinomial(resto,-multPolinomial(b,q));
end



