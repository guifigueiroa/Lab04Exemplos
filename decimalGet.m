function decimal = decimalGet(poli, p)

poli = mod(poli,p);
potencias = p.^(0:length(poli)-1);
decimal = poli*potencias';
