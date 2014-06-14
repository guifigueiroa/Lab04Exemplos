function C = redePerm(P,K,rodadas)

C = P;
blocoSize = 4;
for i=1:rodadas
    C = xor(C,K);
    for j=1:length(P)/blocoSize
        C((j-1)*blocoSize+1:j*blocoSize) = substitui(C((j-1)*blocoSize+1:j*blocoSize));
    end
    C = [C(2:end) C(1)];
end