function J_dehazed = dehazing_model(I, A, t)
J_dehazed = (I - A * (1 - t)) ./ t;
end
