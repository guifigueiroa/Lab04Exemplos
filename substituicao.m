function subs = substituicao( bloco )

    irredutivel = [1 0 0 0 1 1 1 0 1];
    [subs,] = euclidesEstendidoPolinomial(bloco,irredutivel,2);

    if (length(subs) < 8)
		tam = 8 - length(subs);
		subs = [subs zeros([1,tam])];
	end
end