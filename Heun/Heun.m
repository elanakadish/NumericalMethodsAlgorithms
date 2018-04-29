function [t,y] = Heun(dydt, tspan, y0, h, es, maxit)
%Completes Heun's method with iteration 
%   dydt should be entered as an anonymous function (ex. dydt =
%   @(t,y) any function using t and y)
if nargin == 4
    es = 0.001
    maxit = 50
end
if nargin < 4
    error('Must have a minimum of four inputs')
end
if nargin > 6
    error('Cannot have more than 6 inputs')
end
if nargin == 5
    error('Input unclear')
end
tstart = tspan(1)
tend = tspan(end)
for c = tstart:h:tend
    y0 = y 
    ynew = y + h*dydt(c,y)
    
end

