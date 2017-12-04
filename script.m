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
alpha = 1 ;
tn = 1;
new_points = [x0,x1];
epsylon = 0.1;
while 1
old_points = new_points;
dn = -1*gradient(fu);
alpha = armijo(alpha,old_points,1,fu,grad2);
alpha_points = (alpha.*tn.*dn)+old_points';
tn = subs(subs(gradient(fu),alpha_points(1)),alpha_points(2));
new_points = old_points + tn.*dn;
if (new_points(1) - old_points(1)) < epsylon && (new_points(2) - old_points(2)) < epsylon
    disp(new_points)
    break
end
end
