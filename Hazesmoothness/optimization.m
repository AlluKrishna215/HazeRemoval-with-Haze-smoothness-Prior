function J_optimized = optimization(I, A, t)
    J_optimized = (I - A * (1 - t)) ./ t; 
end
