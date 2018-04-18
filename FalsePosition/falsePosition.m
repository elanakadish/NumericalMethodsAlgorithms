function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxiter)
%This function estimates the root of a given function
%   inputs: func = function
%           xl, xu = lower and upper guesses
%           es = goal relative error (default 0.0001%)
%           maxiter = maximum iterations (default 200)
%   outputs: root = real root
%           fx = function value at root
%           approximate relative error (%)
%           iter = number of iterations 
%When calling, initialize with syms x and f(x) = 'your function', then
%using that same f as func when calling falsePosition (or some variable
%that serves the same purpose of "f"
%

if nargin == 3 %if there are not values imputed for es and iter, the values are the defaults
    es = 0.0001; %es defaults to 0.0001% 
    maxiter = 200; %maxiter defaults to 200 iterations
elseif nargin < 3 %if there are less than three imputs, there is missing information
    error ('not enough inputs')
elseif nargin > 5 %if there are more than five imputs, there is too much information
    error ('too many inputs')
elseif nargin == 4 %if there are 4 imputs, it is unclear whether the fourth imput is es or iter, so it is unclear on which defualt should be used and which imput takes the fourth value given
    error ('inputs unclear')
end

checkroot = func(xl) * func(xu); %in order for there to be a root between xl and xu, one must have a positive function value and one must be negative. Multiplying a positive number and a negative number together will always output a negative number, this serves to check that there is in fact a root within the bounds given

if checkroot > 0 %If the function values multiplied is positive, there cannot be a root between them 
    error ('no sign change within parameters')
end

ea = 100; %start approximate error at 100%
iter = 0; %serves as a counter, must be initialized 
xn = xl; %This is used to define xl as a new variable

while ea > es && iter < maxiter%while the approximate relative error is still greater than the desired relative error and we haven't reached the maxumum number of iterations the function will continue 
    xno = xn; %stores old values in xno in order to generate a new xn value in the next loop 
    xn = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu)); %false position formula 
    fxn = func(xn); %function evaluated at root location
    ea = abs((xn-xno)/xn)*100; %approximate relative error (%)
    iter = iter + 1; %count iterations 
end

root = xn; %turn xn into root, an output variable
fx = fxn; %turn fxn into fx, an output variable 

fprintf('The estimated root is %8.4e \n', root)
fprintf('The function evaluated at this root is %8.4e \n', fx)
fprintf('The approximate relative error for this root is %10.10e \n', ea)
fprintf('The number of iterations used is %8.4e \n', iter)
end

