nBits = 8;
nRepeticoes = 100;
nRodadas = 25;

entropia = zeros(1,nRodadas);

for rodadas=1:nRodadas
    matriz = zeros(nBits,nBits);
    for repeticoes=1:nRepeticoes;
        for bit=1:nBits
            P = rand(1,nBits)>.5; %obtem uma chave aleatoria

            K1 = rand(1,nBits)>.5; %obtem um bloco de bits aleatorio
            C1 = redePerm(P,K1,rodadas);

            K2 = K1;
            K2(bit) = ~K2(bit); %inverte um dos bits da chave P1
            C2 = redePerm(P,K2,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end
    end
    disp (rodadas)
    fflush(stdout);
    matriz = matriz/nRepeticoes;
    % Aqui, o max e' utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

plot(entropia)