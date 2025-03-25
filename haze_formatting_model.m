function [J, t, A] = haze_formatting_model(I)
   [r, c, ~] = size(I);
   A = max(I(:));
   t = 0.5 * ones(r, c);
   J = (I - A * (1 - t)) ./ t;
end
