function result = irredutiveisGF(p,n)

primos = zeros(0,n);
for i=p:(p^n-1)
  mx = poliGet(i,p,n);
  primos = [primos; mx];
end

result = [];

for i=(p^n):(p^(n+1)-1)
  mx = poliGet(i,p,n+1);
  testP = 1;
  [a b] = size(primos);
  for j=1:a
    if igualPoliMod(0,divPoliMod(mx,primos(j,:),p),p)
      testP =0;
      break;
    end
  end
  if testP == 1
    result = [result; mx];
  end
end


