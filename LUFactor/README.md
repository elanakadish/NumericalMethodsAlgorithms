# LU Factorization
### Created: 26 Mar 2018
#### Algorithm Description 
This algorithm produces the lower and upper triangular matrices as well as the pivoting matrix of an inputed square matrix. The algorithm uses Gauss elimination with partial pivoting to complete this factorization.
#### Inputs
There is only one input for this algorithm
###### A
This is the square matrix the user wants to be decomposed into L and U
#### Outputs
There are three outputs produced by this algorithm
###### L
L is the lower triangular matrix produced by completing LU factorization on A
###### U 
U is the upper triangular matrix produced by completing LU factorization on A
###### P
P is the matrix that tracks the pivoting of A during the process of creating L and U. P begins as an identity matrix and is then pivoted along with A 
#### Limitations
###### Matrix A
In order to complete the LU factorization of A, the inputed matrix must be square. If it is not, Gauss elimination will not work and the factorization cannot be completed. 
###### Inputs
There can only be one input, A. If there is more than one matrix, variable or number put into the function it cannot be completed because there will be nothing to do with the extrenuous value. 
#### Additional Info
##### Swap
A sub-function called swap was created within this algorithm called swap. This function was meant to shorten the process of pivoting so the lines of code required to complete partial pivoting did not have to be repeated. The function is at botton of the .m file, after the main funciton is ended, and is used under the comment "do pivoting"
