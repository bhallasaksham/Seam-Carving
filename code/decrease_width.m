function [reducedColorImg,reducedEnergyImg] = decrease_width(im,energyImg)
    [height, width, ~] = size(im);
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'VERTICAL');
    reducedColorImg = zeros(height, width -1 , 3);
    reducedEnergyImg = zeros(height, width -1);
    verticalSeam = find_vertical_seam(cumulativeEnergyMap);
    for index = 1:height
        reducedColorImg(index,:,:) = im(index,[1:verticalSeam(index)-1, verticalSeam(index)+1:width],:);
        reducedEnergyImg(index,:) = energyImg(index,[1:verticalSeam(index)-1, verticalSeam(index)+1:width]);
    end
    reducedColorImg = uint8(reducedColorImg);
end
