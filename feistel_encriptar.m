function ciphertext = feistel_encriptar(plain, k, num_rodadas)

tabelaPlain = zeros(1,(ceil(length(plain)/32)*32));

for i=1:length(plain)
    %tabelaPlain(i,:) = mod(dec2bin(double(plain(i)),8),48);
    tabelaPlain(i) = plain(i);
end

tabela32 = zeros((length(tabelaPlain)/32),32);
tabela32_cipher = zeros((length(tabelaPlain)/32),32);
temp = 1; temp2 = 1;

%Preenchendo tabela32...
for i=1:length(tabela32(:,1))
    tabela32(i,1:32) = tabelaPlain(temp2:temp2+31);
    temp = temp+1;
    temp2 = temp2+32;
end

%Funcao F simples, pega o Ko fornecido (numero de 0 a 65535), pega Ro,
% soma os dois (mod 65536).
%O próximo Ko (K1) é Ko + 1 (mod 65536).

for i=1:length(tabela32(:,1)) %fazer para todos os blocos de 32 do texto 'plain'

    L0 = tabela32(i,1:16);
    R0 = tabela32(i,17:32);
    K0 = mod(k,65536);
    for j=1:num_rodadas %fazer para todas as rodadas pedidas
       L1 = R0;
       L1concat = '';
        for TEMP = 1:16
           L1concat = strcat(L1concat,num2str(L0(TEMP)));
        end
        %R1 já aplicando a fórmula F
        xin = strcat((dec2bin(mod((bin2dec(L1concat)+K0),65536),16) ),'');
        bin = zeros(1,16);
        for tempXinBin = 1:16
            bin(tempXinBin) = xin(tempXinBin)-'0';
        end

        R1 = xor (R0(1:16),bin);


       %R1 = xor (L0(1:16),[0 1 0 0 1 0 0 0 1 0 0 0 0 1 0 0 ]);
       %Preparar para próxima rotação
       L0 = L1;
       R0 = R1;     
       K0 = mod((K0 + 1),65536);
    end
    tabela32_cipher(i,1:16) = L0;
    tabela32_cipher(i,17:32) = R0; 
end

%Recompor CIPHERTEXT com o conteúdo de tabela32_cipher

ciphertext = tabela32_cipher;

end