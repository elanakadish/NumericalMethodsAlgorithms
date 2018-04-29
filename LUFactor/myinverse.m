function [invA] = myinverse(A)
%myinverse finds the inverse of a matrix A by using the LU Factorization
%from the LUFactor function I created 
%   Input A must be a square matrix and will be decomposed in the LUFactor
%   function. Output invA will be a matrix of the same dimensions of A but
%   should be the equivilent of if the inverse were to be calculated any other way.  
[L, U] = luFactor2(A); % run the LU Factorization of A 

[m, n] = size(A); %define m and n as the dimensions of A 

invA = A; %initialize invA as a matrix of the size it needs to be, ex A
r = 1; %initialize r for the loop
for r = 1:m %r will start at 1 and run to m (the number of columns in the matrix)
    V = zeros(m, 1); %the unit vector will start as a vector of zeros
    V(r,1) = 1; %it will then have a 1 imposed into the index of r, whatever the loop is at
    d = zeros(m, 1);
    d = L.\V %in the broken down steps of finding the inverse of a matrix, L and the unit vector will be used to solve for a column vector d
    xr = zeros(m, 1);
    xr = U.\xr % the vector d is now used to solve for xr, which is a column vector that is one component of invA
    xr = invA(:, r); %here xr is imposed into invA as all rows and column r (whatever r the loop is at)
end
disp(invA)
end

