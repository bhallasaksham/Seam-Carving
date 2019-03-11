function energyImg = Extra2_energy_img(im)
    gray = rgb2gray(im);
    [Gx, Gy] = imgradientxy(gray);
    energyImg = double(sqrt(Gx.^2 + Gy.^2));
    skinDetector = rgb2hsv(im);
    skinDetector = skinDetector(:,:,1);
    skinDetector(skinDetector < 0.06) = 300;
    energyImg = energyImg + skinDetector;
    imagesc(energyImg)
end