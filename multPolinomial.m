function [result] = multPolinomial(a,b)

a = reduzPolinomial(a);
b = reduzPolinomial(b);

nA = length(a);
nB = length(b);

result = zeros(1,nA+nB-1);

for i=1:(nA+nB-1)
  for j=max(1,i+1-nB):min(i,nA)
    result(i) = result(i) + a(j)*b(i-j+1);
  end
end

index = find(result ~= 0);

result = reduzPolinomial(result);

end


