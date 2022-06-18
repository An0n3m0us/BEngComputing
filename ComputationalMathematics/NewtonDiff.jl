calcDiff(a,b) = round(a - b, digits=10)

function newtonDifference(x, xk, yk)
    dnyk = [yk]

    # Check which side of range it is on
    xkMid = (xk[1]+xk[end])/2

    # Make sure x value is within the xk-range
    if !(x >= xk[1] && x <= xk[end]) return end

    # Forward difference (priority)
    if (x <= xkMid)
        for k = 1:length(xk)-1
            diff = vcat([calcDiff(dnyk[end][i+1], dnyk[end][i]) for i in 1:length(dnyk[end])-1], [NaN])
            push!(dnyk, diff)
        end
        return [i-1 for i in 1:length(xk)], dnyk
    end
    # Backward difference
    if (x > xkMid)
        for k = 1:length(xk)-1
            diff = vcat([NaN], [calcDiff(dnyk[end][i], dnyk[end][i-1]) for i in 2:length(dnyk[end])])
            push!(dnyk, diff)
        end
        return [i-1 for i in 1:length(xk)], dnyk
    end
end

x = 1.5
xk = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4, 1.6, 1.8, 2.0]
yk = [0.000, -0.189, -0.317, -0.332, -0.200, 0.091, 0.525, 1.065, 1.658, 2.243, 2.757]

k, dnyk = newtonDifference(x, xk, yk)
[@show i for i in dnyk]