function subs = substituicao( bloco )

    irredutivel = [1 0 0 0 1 1 1 0 1];
    [subs,] = euclidesEstendidoPolinomial(bloco,irredutivel,2);

end