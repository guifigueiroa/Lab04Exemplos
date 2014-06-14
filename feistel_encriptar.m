function ciphertext = feistel_encriptar(plain, k, num_rodadas)

tabelaPlain = zeros((ceil(length(plain)/8)*8),8);

for i=1:length(plain)
    %Converte o texto 'plain' em seu código ASCII
    tabelaPlain(i,:) = mod(dec2bin(double(plain(i)),8),48);
end

tabela32 = zeros(ceil(length(plain)/4),32);
tabela32_cipher = zeros(ceil(length(plain)/4),32);
temp = 1;

%Abaixo vai transformar o texto, já em ASCII (8 bits) em cadeias de 32 bits
%preenchendo o que sobrar com zeros.
for i=1:ceil(length(plain)/4)
    tabela32(i,1:8) = tabelaPlain(temp,:);
    temp = temp+1;
    tabela32(i,9:16) = tabelaPlain(temp,:);
    temp = temp+1;
    tabela32(i,17:24) = tabelaPlain(temp,:);
    temp = temp+1;
    tabela32(i,25:32) = tabelaPlain(temp,:);
    temp = temp+1;
end

%Funcao F simples, pega o Ko fornecido (numero de 0 a 65535), pega Ro,
% soma os dois (mod 65535) e inverte todos os bits do resultado.
%O próximo Ko (K1) é Ko + 1 (mod 65535).

for i=1:length(tabela32(:,1)) %fazer para todos os blocos de 32 do texto 'plain'
    L0 = tabela32(i,1:16);
    R0 = tabela32(i,17:32);
    K0 = mod(k,65535);
    for j=1:num_rodadas %fazer para todas as rodadas pedidas
    L1 = R0;
    R0concat = '';
    for TEMP = 1:16
        R0concat = strcat(R0concat,num2str(R0(TEMP)));
    end
    %R1 já aplicando a fórmula F
    aaa = (mod(-(dec2bin(mod((K0+bin2dec(R0concat)),65535),16)),'1'));    
    R1 = xor (L0(1:16),aaa);
    
    %Preparar para próxima rotação
    L0 = L1;
    R0 = R1;     
    K0 = mod((K0 + 1),65535);
    end
    tabela32_cipher(i,1:16) = L0;
    tabela32_cipher(i,17:32) = R0; 
    i
end

%Recompor CIPHERTEXT com o conteúdo de tabela32_cipher

ciphertext = tabela32_cipher;

end

