%x0 = 1; 
%x1 = 1;
%a = 5;
%b = 2;
%c = 2;
%d = 7;
%e = 2;
%f = 2;
%syms u(x) v(x)
%H = a*(u-b)^c+d*(v-e)^f;
%D = functionalDerivative(H,[u v]);
%wynik = subs(subs(H,v(x),x0),u(x),x1);
%grad = gradient(H);
%wynik = subs(subs(grad,v(x),x0),u(x),x1);

%fu = sym('10*i^2 + 10*i*j + 8*j^2 -14*i -6*i + 15 ');
fu = sym('5*(u-2)^2+7*(v-2)^2');
grad2 = gradient(fu);
direction = subs(subs(gradient(fu),1),1); % za 1,1 podstaw aktualne x0
alpha = armijo(1,x0,1,fu,grad2);
disp(alpha)