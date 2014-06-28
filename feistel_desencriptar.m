function plain = feistel_desencriptar(cipherBlock, k, num_rodadas)

%Funcao -F simples, pega o Ko fornecido (numero de 0 a 65535), pega Ro,
% subtrai os dois (mod 65536).
%O próximo Ko (K1) é Ko + 1 (mod 65536).


tabela32_plain = zeros(length(cipherBlock(:,1)),32);


for i=1:length(cipherBlock(:,1)) %fazer para todos os blocos de 32 do texto 'plain'
     L0 = cipherBlock(i,1:16);
     R0 = cipherBlock(i,17:32);
     K0 = mod(k,65536);
     

%Calcular K0 pelo número de vezes que se efetuou rodadas     
    for iiiiiii=1:num_rodadas
        K0 = mod((K0 + 1),65536);
    end    
   
    for j=1:num_rodadas %fazer para todas as rodadas pedidas
        K0 = mod((K0 - 1),65536);        
        R1 = L0;
        L1concat = '';
        for TEMP = 1:16
           L1concat = strcat(L1concat,num2str(R0(TEMP)));
        end

        %L1 já aplicando a fórmula F
%         xin = strcat((dec2bin(mod((bin2dec(L1concat)-K0),65536),16) ),'');
        xin2 = strcat((dec2bin(mod((bin2dec(L1concat)),65536),16) ),'');
%         bin = zeros(1,16);
%         for tempXinBin = 1:16
%             bin(tempXinBin) = xin(tempXinBin)-'0';
%         end
%         xin2 = xor(xin2,L0(1:16));
         bin2 = zeros(1,16);
         for tempXinBin = 1:16
             bin2(tempXinBin) = xin2(tempXinBin)-'0';
         end
         bin2 = xor(bin2,L0(1:16));
         binConcat = '';
        for TEMP = 1:16
           binConcat = strcat(binConcat,num2str(bin2(TEMP)));
        end
         binBin = strcat((dec2bin(mod((bin2dec(binConcat)-K0),65536),16) ),'');       
         for tempXinBin = 1:16
             xinXin(tempXinBin) = binBin(tempXinBin)-'0';
         end         
%         L1 = xor (R0(1:16),bin);
       L1 = xinXin;

       %R1 = xor (L0(1:16),[0 1 0 0 1 0 0 0 1 0 0 0 0 1 0 0 ]);


       %Preparar para próxima rotação
       L0 = L1;
       R0 = R1;     
    end

   %  if mod((num_rodadas),2)==1
     tabela32_plain(i,1:16) = L0;
     tabela32_plain(i,17:32) = R0; 
   %  else
   %  tabela32_plain(i,1:16) = L0;
   %  tabela32_plain(i,17:32) = R0; 
   %  end
    
end


%Recompor CIPHERTEXT com o conteúdo de tabela32_cipher


plain = tabela32_plain;

end