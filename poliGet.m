function polinomial = poliGet(decimal, p, n)

polinomial = zeros(1,n);
for i=1:n
    polinomial(i) = mod (decimal,p);
    decimal = floor(decimal/p);
end