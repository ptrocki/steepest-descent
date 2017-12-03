x0 = 1; 
x1 = 1;
a = 5;
b = 2;
c = 2;
d = 7;
e = 2;
f = 2;
syms u(x) v(x)
H = a*(u-b)^c+d*(v-e)^f;
D = functionalDerivative(H,[u v]);
wynik = subs(subs(H,v(x),x0),u(x),x1);

