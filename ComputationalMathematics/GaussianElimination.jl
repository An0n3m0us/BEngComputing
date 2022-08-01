M = [2 3 1 1; 2 6 1 1; 3 2 1 1; 4 5 6 4]

function gaussElim(M)
    A = Float64.(M)
    for mRow = 1:size(A)[1]
        local diag = A[mRow, mRow]
        for column = 1:size(A)[2]
            A[mRow, column] = A[mRow, column]/diag
        end

        for row = mRow+1:size(A)[1]
            local factor = A[row, mRow]
            for column = 1:size(A)[2]
                A[row, column] = A[row, column]-(factor*A[mRow, column])
            end
        end
    end
    
    return A
end

A = gaussElim(M)

@show M
@show A
