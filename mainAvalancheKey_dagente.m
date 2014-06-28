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
        for bit=1:16 %16 porque são 16 bits a chave
            P = rand(1,nBits)>.5; %obtem uma chave aleatoria

            K1 = randi(65535,1);
%             K1 = rand(1,nBits)>.5; %obtem um bloco de bits aleatorio
            C1 = feistel_encriptar(P,K1,rodadas);

            K2 = K1;
            
        K2concat = num2str(dec2bin(K2,16));
        if K2concat(bit)=='0'
            K2concat(bit)='1';
        else K2concat(bit)='0'; end
        
        K2 = bin2dec(K2concat);
%             K2(bit) = ~K2(bit); %inverte um dos bits da chave P1

            C2 = feistel_encriptar(P,K2,rodadas);

            %computa o que mudou na cifra
            matriz(bit,:) = matriz(bit,:) + xor(C1,C2);
        end
    end
    disp (rodadas)
%    fflush(stdout);
    matriz = matriz/nRepeticoes;
    
    matrizNova = zeros(16,nBits); %Para considerar os 16 bits da chave K utilizada
    
    for i = 1:16
        matrizNova(i,:) = matriz(i,:);
    end
    
    matriz = matrizNova;    
    
    % Aqui, o max e' utilizado para garantir que log(0) = 0
    entropia(rodadas) = mean(mean((max(-log2(matriz).*matriz,0) + max(-log2(1-matriz).*(1-matriz),0))));
end

plot(entropia)