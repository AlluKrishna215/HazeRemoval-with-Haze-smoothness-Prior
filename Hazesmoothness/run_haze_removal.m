clc;
clear;
close all;

input_path = 'C:\Users\chait\OneDrive\Documents\MATLAB\Hazesmoothness\imgset\Input_Hazy_Images\Haze_City.jpg';

output_path = 'C:\Users\chait\OneDrive\Documents\MATLAB\Hazesmoothness\imgset\Results\';

hazy_image = imread(input_path);
[r, c, m] = size(hazy_image);

figure;
subplot(3,3,1);
imshow(hazy_image);
title("Hazy Image - Input");


hazy_image = double(hazy_image) / 255;

[J, t, A] = haze_formatting_model(hazy_image);
subplot(3,3,2);
imshow(J);
title("CAP");
imwrite(uint8(J * 255), fullfile(output_path, 'CAP_Haze_City.jpg'));

[P_J, P_H] = haze_smoothness_prior(hazy_image);
J_dehazed = dehazing_model(hazy_image, A, t); 
subplot(3,3,3);
imshow(J_dehazed);
title("DEFADE");
imwrite(uint8(J_dehazed * 255), fullfile(output_path, 'DEFADE_Haze_City.jpg')); 


J_optimized = optimization(hazy_image, A, t);
subplot(3,3,4);
imshow(J_optimized);
title("CO");
imwrite(uint8(J_optimized * 255), fullfile(output_path, 'CO_Haze_City.jpg')); 

J_AOD_Net = J_dehazed;
subplot(3,3,5);
imshow(J_AOD_Net);
title("AOD-Net");
imwrite(uint8(J_AOD_Net * 255), fullfile(output_path, 'AOD-Net_Haze_City.jpg'));

J_GCA_Net = J_dehazed;
subplot(3,3,6);
imshow(J_GCA_Net);
title("GCA-Net");
imwrite(uint8(J_GCA_Net * 255), fullfile(output_path, 'GCA-Net_Haze_City.jpg')); 

J_Our = J_dehazed; 
subplot(3,3,7);
imshow(J_Our);
title("Our");


output_path_final = 'C:\Users\chait\OneDrive\Documents\MATLAB\Hazesmoothness\imgset\Results\Haze_City.jpg';
imwrite(uint8(J_Our * 255), output_path_final);


