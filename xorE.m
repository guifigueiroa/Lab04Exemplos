function C = xorE(P,K,rodadas)

C = P;
for i=1:rodadas
    C = xor(C,K);
    C = [C(2:end) C(1)];
end