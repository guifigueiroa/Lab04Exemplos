Nas funções disponibilizadas, os polinômios são representados por vetores, nos quais os coeficientes de menor grau são representados primeiros.
Portanto o polinômio x^2 + 7x^4 é representado como [0 0 1 0 7] ou [0 0 1 0 7 0 0 0 0 0 0] (quantos zeros desejar a direita).

Funções Importantes:

- poliGet(decimal, p, n) - transforma "decimal" em uma representação polimial no corpo finito p^n
- decimal = decimalGet(poli, p) - transforma "poli" em uma representação decimal considerando um corpo finito p^x (x vai depender do tamanho de "poli")
- somaPoliMod(poli1,poli2,p) - soma os polinômios "poli1" e "poli2" no corpo finito p^x (x vai depender do tamanho de "poli1" e "poli2")
- multiPoliMod(poli1,poli2,p) - multiplica os polinômios "poli1" e "poli2" no corpo finito p^x (x vai depender do tamanho de "poli1" e "poli2")
- [resto quaociente] =  divPoliMod(poli1,poli2,p) - divide o polinômio "poli1" pelo polinômio "poli2" no corpo finito p^x (x vai depender do tamanho de "poli1" e "poli2"), retorna o resto e quociente da divisão
- [inv, mdc] = euclidesEstendido(b,p) - encontra o inverso multiplicativo do número decimal "b" no corpo finito "p", isto é, encontra b^(-1) mod p (retorna também o máximo divisor comum)
- [inv, mdc] = euclidesEstendidoPolinomial(poli,irredutivel,p) - encontra o inverso multiplicativo do polinomio "poli", utilizando o polinomio irredutível "irredutivel" no corpo finito "p^x" (x vai depender do tamanho de "irredutivel"), também retorna o máximo divisor comum.


Para resolver o exercício 5 basta digitar
euclidesEstendido(42,149)

Exercício 7a
somaPoliMod([2 3 4],[1 2 3],5)

Exercício 7b
somaPoliMod([2 3 4],-[1 2 3],5)

Exercício 7c
multPoliMod([2 3 4],[1 2 3],5)

Exercício 7d
[resto quociente] = divPoliMod([2 3 4],[1 2 3],5)


Exercício 8
euclidesEstendidoPolinomial([0 1 1],[1 1 0 1],2)

Exercício 9
irredutivel = [1 0 1];
matrizMulti = zeros(3^2);
for i = 0:3^2-1
	for j = 0:3^2-1
		iPoli = poliGet(i,3,2);
		jPoli = poliGet(j,3,2);
        multiplicacao = multPoliMod(iPoli,jPoli,3);
		resto = divPoliMod(multiplicacao,irredutivel,3);
		matrizMulti(i+1,j+1) = decimalGet(resto,3);
	end
end
disp(matrizMulti);
