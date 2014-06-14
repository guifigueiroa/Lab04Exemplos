function [result] = somaPolinomial(a,b)

a = reduzPolinomial(a);
b = reduzPolinomial(b);

ordem = max(length(a),length(b));
a = [a zeros(1,ordem-length(a))];
b = [b zeros(1,ordem-length(b))];

result = zeros(1,ordem);

result = a + b;


result = reduzPolinomial(result);

end


