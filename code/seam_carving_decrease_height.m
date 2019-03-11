im = imread('inputSeamCarvingPrague.jpg');
 energyImg = energy_img(im);
 for index = 1:50
    [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg);
    im = reducedColorImg;
    energyImg = reducedEnergyImg;
 end
imwrite(im,'outputReduceHeightPrague.png');

