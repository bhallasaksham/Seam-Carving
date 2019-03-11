function energyImg = energy_img(im)
    gray = rgb2gray(im);
    [Gx, Gy] = imgradientxy(gray);
    energyImg = double(sqrt(Gx.^2 + Gy.^2));
end