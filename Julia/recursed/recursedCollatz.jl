#!/usr/bin/julia


#Creating aays to store data in
julia>PosArray = [0,0,0,0,0,0,0,0,0,0] 
julia>StepsArray = [0,0,0,0,0,0,0,0,0,0]

max = 5000
#Major Loop for Placing Values in the aays
for i =1:max
    comp= collatz
    if comp > StepsArray[0] && !(InArray(comp,StepsArray))
        PosArray[0] = i
        StepsArray[0] = comp
    end 
    bubblesort(StepsArray, PosArray)
end
println("Here are the Top 10 based on Steps: 1st Array is Position, 2nd array is Steps")
println(PosArray)
println(StepsArray)
println("                              ")

bubblesort(PosArray, StepsArray)
println("Here are the Top 10 based on Magnitude of Position: 1st Array is Position, 2nd array is Steps")
println(PosArray)
println(StepsArray)


function collatz(n)
   csteps = 0
    while n != 1
        if (n%2 == 1)
            n = 3*n + 1
        else
            n = n ÷ 2
        end
       csteps =csteps + 1
    end
    return csteps
end 

function bubblesort!(a::AbstractVector, b::AbstractVector)
    for _ in 2:length(a), j in 1:length(a)-1
        if a[j] > a[j+1]
            a[j], a[j+1] = a[j+1], a[j] #Primary Array Swap
            b[j],b[j+1] = b[j+1], b[j] #Secondary Array Swap
        end
    end
    return a
end

#Function to check if the value is already in the array
function InArray(newNum, CStepsArray:AbstractVector)
    size= length(a)
    for i = 0:size
        if CStepsArray[i] ==newNum
            return true
        end
    end
    return false
end