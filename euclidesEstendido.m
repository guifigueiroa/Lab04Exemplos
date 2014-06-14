function [inv, mdc] = euclidesEstendido(b,m)

A = [1 0 m];
B = [0 1 b];

while true
if B(3) == 0
  mdc = A(3);
  inv = 0;
  return
end

if B(3) == 1
  mdc = B(3);
  inv = mod(B(2),m);
  return
end

Q = floor(A(3)/B(3));

T = A - Q*B;
A  = B;
B = T;

end


