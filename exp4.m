function C = exp4 (P, K, num_rodadas)
    C = P;

    for bloco=1:length(C(:,1)) % Para todos os blocos de 32 bits

        L0 = C(bloco,1:8);
        R0 = C(bloco,9:16);

        for rodada=1:num_rodadas % Para cada rodada
            L1 = R0;

            % Formula F
            %R0 = expansao(R0);
            R0 = xor(R0, permKey(K, rodada));
            if ~isequal(R0,zeros(1,8))
                R0 = substituicao(R0);
            end
            R0 = permutacao(R0, rodada);
            
            R1 = xor (L0, R0);

            % Inversao para proxima rodada
            L0 =  L1;
            R0 = R1;
        end

        C(bloco,1:8) = L0;
        C(bloco,9:16) = R0;

    end
end

