function [inv, mdc] = euclidesEstendidoPolinomial(b,mx,m)

b = divPoliMod(b,mx,m);

A{1} = 1;
A{2} = 0;
A{3} = mx;

B{1} = 0;
B{2} = 1;
B{3} = b;


while true

    if igualPoliMod(B{3},0,m)
        if length(A{3}) > 1
            disp('O polinomio "mx" nao eh irredutivel.');
            mdc = A{3};
            inv = 0;
            return;
        end
        mdc = mod(A{3}*euclidesEstendido(A{3},m),m);
        inv = mod(divPoliMod(A{2},mx,m)*euclidesEstendido(A{3},m),m);
        return
    end

    [rx qx] = divPoliMod(A{3},B{3},m);
    Q = qx;

    T{1} = somaPoliMod(A{1},-multPoliMod(Q,B{1},m),m);
    T{2} = somaPoliMod(A{2},-multPoliMod(Q,B{2},m),m);
    T{3} = somaPoliMod(A{3},-multPoliMod(Q,B{3},m),m);
    A  = B;
    B = T;

end


