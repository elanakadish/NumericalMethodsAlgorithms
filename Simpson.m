function [I] = Simpson(x,y)
%This function will preform Simpson's 1/3 rule
%   x is the vector of data in the x direction, y is the vecotr of data in
%   the y direction, I is the output of the total integral estimate after
%   using Simpson's 1/3 rule *(note, if the length of x, and therefore y,
%   is even and therefore will cause there to be an odd number of segments,
%   the trapezoidal rule will be used on the last segement so Simpson's
%   1/3 rule which requries an even number of segments can still be used

if nargin ~= 2 %There must be both an x and y input for the function to work
    error ('Must have x and y inputs')
end
A = diff (x);
if max(A) ~= min(A) %determining if the elements of x are evenly spaced
    error('x must have evenly spaced elements')
end
if length(x)~= length(y) %the number of x and y inputs must be equal
    error('x and y must be of equal lengths')
end
n = length(x);
if rem(n, 2) == 0 %if when dividing the length of x by 2 you are not given a remainder, that means the length of x is even, providing an odd number of segments. in that case the trapezoidal rule will be applied for the final interval
    warning('Trapezoidal rule will be used') 
    a = x(1); %lower bound is the first x value in the vector 
    b = x(n-1); %upper bound is the second to last x value in the vector because here, we are preforming the trapezoidal rule on the last segement
    onethird = (b-a)*(y(1)+4*([sum(y(:,1:2:n-1))])+2*([sum(y(:,2:2:n-1))])+y(n-1))/(3*n); %complete the composite one third rule up through n-1
    a = x(n-1); %redefine a and b for the trapezoidal rule (a is the lower bound: x(n-1))
    b = x(n); %redefine a and b for the trapezoidal rule (b is the upper boudn: x(n))
    trap = (b-a)*(y(n-1)+y(n))/2; %compelte the trapezoidal rule 
    I = onethird + trap %the integral approximation equals the number found for the composite one third rule added to the value found for the trapezoidal rule 
else %this is in the case that the above condition is not true and the length of x is odd, meaning there would be an even number of segments, so the one third rule can be completed without supplementation from the trapezoidal rule 
    a = x(1);
    b = x(n);
    onethird = (b-a)*(y(1)+4*([sum(y(:, 1:2:n))])+2*([sum(y(:, 1:2:n))])+y(n))/(3*n); %complete the one third rule for the whole data set 
    I = onethird %in this case I is equal to the result of the 1/3 rule equation 
end
disp(I)
end

