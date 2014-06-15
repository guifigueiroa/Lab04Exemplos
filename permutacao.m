function perm = permutacao( bloco, rodada )

% calcula o shift de acordo com a rodada
shift = mod(rodada-1,8)+1;

% faz a permutação de acordo com o valor de shift
perm(1:8-shift) = bloco(shift+1:8);
perm(9-shift:8) = bloco(1:shift);

end

