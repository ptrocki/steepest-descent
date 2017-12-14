
results =zeros(1,6);
f = sym('5*(a-10)^2+7*(b-10)^2');
%f = sym('5*(a-10)^3+7*(b-10)^2'); func which has not got a minimum 
grad = gradient(f);

syms a
syms b
syms tau
ypsylon = 10^(-2);

k = 0; 
x = [3 3]';
    
while 1>0
    x_temp = x;
    k = k+1;
    d = -1 * subs(grad,[a b], x'); 
    x_tau = x + tau.*d;
    if isinf(x_tau(2)) || isinf(x_tau(1))
        disp("Func has not got a minumum")
        disp(results(k-1,:))
        break;
    end 
    func_to_opt2 = subs(f,[a b], x_tau');
    min_of_tau_func = simulannealbnd(matlabFunction(func_to_opt2),double(x(1)));
    x = x + d.*min_of_tau_func;
    results(k,:) = [k, x_temp(1), x_temp(2), d(1), d(2), subs(f,[a b], x_temp') ];
    if norm(x - x_temp) < ypsylon
        disp(results(k,:))
        break;
    end
end