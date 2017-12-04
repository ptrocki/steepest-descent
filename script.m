
results =zeros(1,7);

f = sym('5*(a-2)^2+7*(b-2)^2');
grad = gradient(f);

syms a
syms b
ypsylon = 10^(-1);

k = 0; 
x = [4 4]';
    
while 1>0
    x_prior = x;
    k = k+1;
    d = -1 * subs(grad,[a b], x'); 
    alpha = 0.1;
    
    x = x + alpha .* (d);
  
    results(k,:) = [k, x_prior(1), x_prior(2), d(1), d(2), norm(d), subs(f,[a b], x_prior') ];

    if norm(x - x_prior,2) < ypsylon
        break;
    end
end