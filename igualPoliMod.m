function [result] = igualPoliMod(a,b,m)

a = reduzPolinomial(mod(a,m));
b = reduzPolinomial(mod(b,m));

if length(a) ~= length(b)
result = false;
elseif a == b
result = true;
else
result = false;
end

end


