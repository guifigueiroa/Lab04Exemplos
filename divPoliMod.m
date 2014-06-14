function [resto quociente] = divPoliMod(a,b,m)

a = mod(reduzPolinomial(a),m);
b = mod(reduzPolinomial(b),m);

nA = length(a);
nB = length(b);

quociente = zeros(1,max(nA-nB+1,1));
resto = a;

while length(resto) >= length(b) && any(resto)
q = zeros(1,max(nA-nB+1,1));
q(length(resto)-length(b)+1) = mod(mod(resto(end),m)*euclidesEstendido(b(end),m),m);
quociente = quociente + q;
resto = somaPoliMod(resto,-multPoliMod(b,q,m),m);
end

resto = mod(resto,m);
quociente = mod(quociente,m);

