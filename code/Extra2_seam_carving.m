im = imread('extra2.jpeg');
energyImg = Extra2_energy_img(im);
for index = 1:525
    [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg);
    im = reducedColorImg;
    energyImg = reducedEnergyImg;
end
imwrite(im,  'outputExtra2WithSkinDetection.jpg');

im = imread('extra2.jpeg');
energyImg = energy_img(im);
for index = 1:525
    [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg);
    im = reducedColorImg;
    energyImg = reducedEnergyImg;
end
imwrite(im,  'outputExtra2WithoutSkinDetection.jpg');
