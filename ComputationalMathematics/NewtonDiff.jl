calcDiff(a,b) = round(a - b, digits=10)

function newtonDifference(x, xk, yk)
    dnyk = [yk]

    # Check which side of range it is on
    xkMid = (xk[1]+xk[end])/2

    # Make sure x value is within the xk-range
    if !(x >= xk[1] && x <= xk[end]) return end

    # Forward difference is the precendence
    N = !(x <= xkMid)

    # Loop through xk values
    for k = 1:length(xk)-1
        # y[k+1-N] - y[k-N] gives (y[k+1] - y[k]) or (y[k] - y[k-1])
        # for FDiff (N = 0) or BDiff (N = 1) respectively
        diff = vcat(repeat([NaN], N), [calcDiff(dnyk[end][i+1-N], dnyk[end][i-N]) for i in (1+N):length(dnyk[end])+(-1+N)], repeat([NaN], !N))
        push!(dnyk, diff)
    end

    # Return k and dnyk
    return [k-1 for k in 1:length(xk)], dnyk
end

x = 1.5
xk = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0]
yk = [0.000, -0.189, -0.317, -0.332, -0.200, 0.091, 0.525, 1.065, 1.658, 2.243, 2.757]

k, dnyk = newtonDifference(x, xk, yk)
@show k
[@show i for i in dnyk]