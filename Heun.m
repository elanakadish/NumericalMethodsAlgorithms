function [t,y] = Heun(dydt, tspan, y0, h, es, maxit)
%Completes Heun's method with iteration 
%   dydt should be entered as an anonymous function (ex. dydt =
%   @(t,y) any function using t and y); tspan should be a row vector with
%   (at least) the starting and ending desired t-values; y0 is the y value
%   when t = 0; h is the step size between the right and left points being
%   used; es is the desired approximate error; 
if nargin == 4 %if the final 2 inputs are omitted, they default to 0.001 (es) and 50 (maxit)
    es = 0.001;
    maxit = 50;
end
if nargin < 4 %there cannot be fewer than four inputs, if there are an error will be recieved
    error('Must have a minimum of four inputs')
end
if nargin > 6 %there cannot be more than 6 inputs, if there are an error will be recieved
    error('Cannot have more than 6 inputs')
end
if nargin == 5 %if there are only 5 inputs, it is unclear whether the final input is intended to be es or maxit
    error('Input unclear')
end
t=0
y=0
[t,y] = ode23(dydt, tspan, y0); %Initializing t and y to be put on a plot
plot(t,y) %plot the differential equation 
tstart = tspan(1); %tstart will be whatever is in the first index of tspan
tend = tspan(end); %tend will be whatever is in the final index of tspan
ea = 1; %initialize the approximate error
iter = 0; %iter is the counter
while ea < es && iter < maxit %the loop will continue as long as the approximate error is less than es and the number of iterations is less than maxit. Once one of these conditions is broken the loop will end
    for c = tstart:h:tend %C will be the counter and it will go from tstart to tend in increments of h
        y = y0; %the contents of y0 will be placed in the variable y
        slopeleft = dydt(c,y); %slopeleft will hold the "left hand" prediction of the slope. It will be used to calculate a new y value
        ynew = y + h*slopeleft; %a new estimate (prediciton/Euler's method) of y is created
        sloperight = dydt(c+h, ynew); %Using the new y value a right hand estimate of the slope is created
        ycorrection(c) = y + (h/2)*(slopeleft+ sloperight); %using Heun's method to correct the estimate for y using the average of the two slopes
        ea = abs((ycorrection - y)/ycorrection); %approximate error = abs((new-old)/new)
        y = ycorrection; %put what is stored in ycorrection into y for the next iteration 
        
%         if rem(tend, h) ~= 0 %if the final number in tspan is not divisible by the step size h, then the final iteration will need to be altered
%             
%             y = dydt(
%             slopeleft = dydt(c,y);
%             ynew = y + h*slopeleft;
%             sloperight = dydt(tend, ynew);
%             ycorrection(c) = y + (h/2)*(slopeleft+ sloperight);
%         else
%             ; %If this is not the case, nothing needs to be done 
%         end
        iter = iter + 1; %add one to the counter;
    end 
end
end

