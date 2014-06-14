function [result] = reduzPolinomial(a)
index = find(a ~= 0);

if index
result = a(1:index(end));
else
result = 0;
end
