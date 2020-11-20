#!/usr/bin/julia

julia>PosArray = [0,0,0,0,0,0,0,0,0,0]
julia>StepsArray = [0,0,0,0,0,0,0,0,0,0]






    count = 0
    while n != 1
        if (n%2 == 1)
            n = 3*n + 1
        else
            n = n / 2
        end
        count = count + 1
    end 
    
