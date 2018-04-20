# False Position
### Created: 19 Feb 2018

#### Algorithm Description 
This algorithm estimates the root of a function using the fasle position method
When calling the function, you must specify the variable being used in your function with syms or something that serves the same function

#### Inputs
This function requires up to five inputs
###### Func
This is the function you want the algorithm to estimate the roots of 
###### xl
This is the lower intial estimate
###### xu 
This is the upper initial estimate
###### es
This is the goal relative error, the desired error that the function will reach
If the function is not given an input for es, it will default to 0.0001%
###### maxiter
This is the maximum number of iterations that the function will complete
If the funciton is not given an imput for maxiter, it will default to 200

#### Outputs
This function will produce four outputs
###### root
This output will be the root (the x value)
###### fx
This output will be the function value of 'root' (the y value)
###### ea 
This output will be the approximate relative error (%)
Equation: abs((current estimate-previous estimate)/(current estimate))* 100
###### iter
This output will be the number of iterations actually used until the es value provided was given
If the output for iter provided is euqal to the maxiter value inputed above, it means the maximum number of iterations was reached before reaching the desired relative error value 

#### Limitations
###### Inputs
If fewer than 3 or more than 5 inputs are read in the function, it will output an error. This is because the algorithm needs a function to evaluate and initial guesses, otherwise there will not be anywehere to start. Additionally, the algorithm would not know what to do with a sixth or higher input because there is not a defined input for more than five. 
If only 4 inputs are read the algorithm will output an error because it would be unclear whether the fourth input is es or maxiter
###### Root guesses
The algorithm will check to ensure that one root guess has  function value that is positive while the other is negative. If this is not the case, the algorithm will output an error as there is no function that exists between those values. 
#### Additional Info
###### False Position Formula
The formula used in this algorithm is the false position formula. In the formula shown below, f(x) indicated the function value of the provided x value, xu indicates the upper estimate (the same as above) and xl indicates the lower estimate (the same as above)
xu - (f(xu)-(xl-xu))/(f(xl)-f(xu))
