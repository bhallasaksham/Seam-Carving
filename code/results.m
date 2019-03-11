% FIRST IMAGE 

OI = imread('badExample.png');
[row,col,~] = size(OI);
subplot(3,1,1)
imshow(OI)
title('a) the original input image')
im = OI;
energyImg = energy_img(im);
for index = 1:350
     [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg);
     im = reducedColorImg;
     energyImg = reducedEnergyImg;
end
 
for index = 1:
    [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg);
    im = reducedColorImg;
    energyImg = reducedEnergyImg;
end

subplot(3,1,2)
imshow(im)
title('b) our systems resized image')

imr = imresize(OI, [row - 100, col - 250]);
subplot(3,1,3)
imshow(imr)
title('c) result with simple resizing using imresize ')



% horizontalCumulativeEnergyMap_1 = cumulative_min_energy_map(energyImg_1, "HORIZONTAL");
% verticalCumulativeEnergyMap_1 = cumulative_min_energy_map(energyImg_1, "VERTICAL");
% horizontalSeam_1 = find_horizontal_seam(horizontalCumulativeEnergyMap_1);
% verticalSeam_1 = find_vertical_seam(verticalCumulativeEnergyMap_1);



