function [alpha_armijo] = armijo(f,a,b)
% ------------------------GOLDEN SECTION METHOD----------------------------
%a=0;                            % start of interval
%b=2;                            % end of interval
epsilon=0.1;               % accuracy value
iter= 50;                       % maximum number of iterations
tau=double((sqrt(5)-1)/2);      % golden proportion coefficient, around 0.618
k=0;                            % number of iterations


x1=a+(1-tau)*(b-a);             % computing x values
x2=a+tau*(b-a);

f_x1=f(x1);                     % computing values in x points
f_x2=f(x2);


while ((abs(b-a)>epsilon) && (k<iter))
    k=k+1;
    if(f_x1<f_x2)
        b=x2;
        x2=x1;
        x1=a+(1-tau)*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
    else
        a=x1;
        x1=x2;
        x2=a+tau*(b-a);
        
        f_x1=f(x1);
        f_x2=f(x2);
        
    end
    
    k=k+1;
end

sprintf('number of iteration of golden SECTION METHOD =%f', k)
if(f_x1<f_x2)
    alpha_armijo = [x1;f_x1];
else
    alpha_armijo = [x2;f_x2];
end

end

