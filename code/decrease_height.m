function [reducedColorImg,reducedEnergyImg] = decrease_height(im,energyImg)
    [height, width, ~] = size(im);
    cumulativeEnergyMap = cumulative_min_energy_map(energyImg, 'HORIZONTAL');
    reducedColorImg = zeros(height-1, width , 3);
    reducedEnergyImg = zeros(height-1, width);
    horizontalSeam = find_horizontal_seam(cumulativeEnergyMap);
    for index = 1:width
        reducedColorImg(:,index,:) = im([1:horizontalSeam(index)-1, horizontalSeam(index)+1:height],index,:);
        reducedEnergyImg(:,index) = energyImg([1:horizontalSeam(index)-1, horizontalSeam(index)+1:height],index);
    end
    reducedColorImg = uint8(reducedColorImg);
end
