im = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(im);
for index = 1:100
    [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg);
    im = reducedColorImg;
    energyImg = reducedEnergyImg;
end
imwrite(im,'outputReduceWidthPrague.png');

