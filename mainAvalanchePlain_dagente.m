% nBits = 8;
% nRepeticoes = 100;
% nRodadas = 25;

nBits = 32;
nRepeticoes = 100;
nRodadas = 25;

entropia = zeros(1,nRodadas);

for rodadas=1:nRodadas
    matriz = zeros(nBits,nBits);
    for repeticoes=1:nRepeticoes;
        for bit=1:nBits
%             K = rand(1,nBits)>.5; %obtem uma chave aleatoria
            K = randi(65535,1);
            P1 = rand(1,nBits)>.5; %obtem um bloco de bits aleatorio
            C1 = feistel_encriptar(P1,K,rodadas);

            P2 = P1;
            P2(bit) = ~P2(bit); %inverte um dos bits da chave P1
            C2 = feistel_encriptar(P2,K,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end    
    end
    disp (rodadas)
%    fflush(stdout);
    matriz = matriz/repeticoes;
    % Aqui, o max e' utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

plot(entropia)