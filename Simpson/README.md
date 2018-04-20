# Simpson's 1/3 Rule
### Created: 9 Apr 2018
#### Algorithm Description 
This function will complete Simpson's 1/3 rule on a set of points. Because Simpson's 1/3 requres an even number of segments (an odd number of points), if this is not the case, the trapezoidal rule will be used to compelte the integration approximation.
#### Inputs
###### X
X will be a vector that represents the x values of the points of the function that is being integrated
###### Y
Y will be a vector that represents the y values of the points of the function that is being integrated 
#### Outputs
###### I
I will be the integration approximation that is produced by using Simpson's 1/3
#### Limitations
###### Inputs
There can be no more and no fewer than 2 inputs, an x vector and a y vector. This is because Simpson's 1/3 is only set up to work on a 2-axis system, and therefore needs both sets of points but cannot integrate in, for example, 3 dimensions.
###### X and Y
X and Y vectors that are inputed must be equal to each other. If they are not, there is an incomplete graph and the function cannot be integrated
###### Spacing
The values of the X vector must be evenly spaced. Again, due to the nature of Simpson's 1/3 rule, if the points in the X direction are not evenly spaced, the equation will not work.
###### Trapezoidal rule
As mentioned above, if there is not an odd number of indeces in the X and Y vectors, then the trapzoidal rule will be used on the end to finish the approximation
#### Additional Info
Here, a is the upper bound of the situation and b is the lower bound
The equation used for Simpson's 1/3 rule is: (b - a) * (y(1) + 4 * ([sum(y(:,1:2:n-1))]) + 2 * ([sum(y(:,2:2:n-1))]) + y(n-1)) / (3 * n)
The equation used for the trapezoidal rule is: (b - a) * (y(n-1) + y(n)) / 2
