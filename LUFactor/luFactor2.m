function [L, U, P] = luFactor2(A)
%An actually functionin version of the LU algorithm that I couldn't do for
%homework thanks to the TA in review sessions 
%   Damn this thing actually works unlike fuckin version one 
[m, n] = size (A)
if m~=n
    error('Matrix is not square');
end

if nargin ~= 1
    error('Function must have one input')
end
%initialize all matrices
L = eye(m);
U = A;
P = eye(m);

%loop over columns 
for c = 1:n-1 %c is the column index; don't need to do anything to last column so you only need to go to n-1
   
    %do pivoting
    col = abs(U(c:end, c));
    [maxVal, index] = max(col);
    U = swap(U, c, index);
    P = swap(P, c, index);
    
    %loop over rows
    for r = c+1:m %r is the row index; don't need to do anything to first column so you need to start at 2
      
        %do row reduction (elimination)
        factor = U(r, c)/U(c, c);
        U(r,:) = U(r,:) - (factor*U(c, :));
        U(r,c) = 0; %override any floating point errors
        
    end
    
end
% hack for L 
L = (P*A)/U;
end
 
function [rrA] = swap(A, row1, row2) %a function to do pivoting 
rrA = A; %row reduced A = A
rrA(row1,:) = A(row2,:);
rrA(row2,:) = A(row1,:);
end
