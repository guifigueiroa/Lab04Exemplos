function [result] = multPoliMod(a,b,m)

a = mod(reduzPolinomial(a),m);
b = mod(reduzPolinomial(b),m);

nA = length(a);
nB = length(b);

result = zeros(1,nA+nB-1);

for i=1:(nA+nB-1)
  for j=max(1,i+1-nB):min(i,nA)
    result(i) = result(i) + a(j)*b(i-j+1);
  end
end

result = mod(result,m);

index = find(result ~= 0);

result = reduzPolinomial(result);

end



