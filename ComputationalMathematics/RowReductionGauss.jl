M = [2 3 1 2; 2 6 1 4; 3 2 1 6]

# Input: M (mxn matrix), type (0 = Gaussian Elimination, 1 = Gauss-Jordan Elimination)
# Output: A (reduced mxn matrix)
function rowReduction(M, type::Int64=0)
    A = Float64.(M)
    for mRow = 1:size(A)[1]
        local pivot = A[mRow, mRow]
        for column = 1:size(A)[2]
            A[mRow, column] = A[mRow, column]/pivot
        end
        start = type == 0 ? mRow+1 : 1
        for row = start:size(A)[1]
            if row != mRow
                local factor = A[row, mRow]
                for column = 1:size(A)[2]
                    A[row, column] = A[row, column]-(factor*A[mRow, column])
                end
            end
        end
    end
    return A
end

A = rowReduction(M, 0)

@show M
@show A
