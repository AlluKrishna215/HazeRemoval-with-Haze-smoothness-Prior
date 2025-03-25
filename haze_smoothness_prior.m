function [P_J, P_H] = haze_smoothness_prior(I)
   [r, c, ~] = size(I);
   grad_I = gradient(I); 
   grad_J = gradient(I); 
   P_J = exp(-0.5 * (grad_I.^2)); 
   P_H = exp(-0.5 * (grad_J.^2));
end
