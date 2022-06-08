import LinearAlgebra: norm

# Define square matrix X
A = [1 2 -1; 1 0 1; 4 -4 5]
X = transpose([0 0 1])
delta = 0.001

magX1 = norm(X)

#while true

# Calculate Y = AX
Y = A*X
# Find value of largest element in magnitude
K = Y[argmax(abs.(Y))]
# Calculate fresh value X
X = (1/K)*Y
magX2 = norm(X)
#(magX2 - magX1) > delta || break
@show K
@show X

# Calculate Y = AX
Y = A*X
# Find value of largest element in magnitude
K = Y[argmax(abs.(Y))]
# Calculate fresh value X
X = (1/K)*Y
magX2 = norm(X)
#(magX2 - magX1) > delta || break
@show K
@show X

# Calculate Y = AX
Y = A*X
# Find value of largest element in magnitude
K = Y[argmax(abs.(Y))]
# Calculate fresh value X
X = (1/K)*Y
magX2 = norm(X)
#(magX2 - magX1) > delta || break
@show K
@show X

#end