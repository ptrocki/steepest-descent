ypsilon=0.1;
s = 2;
x0 = 10;
z_n = x0;
t = 1;
tn = t;

while true
    d_n = gradient(fun(z_n)); 
    tn = min(fun(z_n+tn*d_n));
    z_n1 = z_n + tn*d_n;
    if abs(z_n1-z_n) < ypsilon
        disp(z_n)
        break
    end
    z_n = z_n1;
end