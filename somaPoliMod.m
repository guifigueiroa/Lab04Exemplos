function [result] = somaPoliMod(a,b,m)

a = mod(reduzPolinomial(a),m);
b = mod(reduzPolinomial(b),m);

ordem = max(length(a),length(b));
a = [a zeros(1,ordem-length(a))];
b = [b zeros(1,ordem-length(b))];

result = zeros(1,ordem);

result = mod(a + b,m);


result = reduzPolinomial(result);

end


