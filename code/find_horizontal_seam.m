function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
    [height, width] = size(cumulativeEnergyMap);
    retArray = zeros(width, 1);
    index = width;
    area = cumulativeEnergyMap(:, width);
    [~ ,location] = min(area);
    seamIndex = location;
    retArray(index) = seamIndex;
    index = index - 1;
    if seamIndex == 1 
        area = [realmax, cumulativeEnergyMap(seamIndex, width - 1), cumulativeEnergyMap(seamIndex + 1, width - 1)];
    elseif seamIndex == height
        area = [cumulativeEnergyMap(seamIndex - 1, width - 1), cumulativeEnergyMap(seamIndex, width - 1), realmax];
    else
        area = [cumulativeEnergyMap(seamIndex - 1, width - 1), cumulativeEnergyMap(seamIndex, width - 1), cumulativeEnergyMap(seamIndex + 1, width - 1)];
    end
    for col = width-1:-1:1
        [~, location] = min(area);
        if location == 1
            seamIndex = seamIndex - 1;
        elseif location == 3
            seamIndex = seamIndex + 1;
        end
        retArray(index) = seamIndex;
        index = index - 1;
        if col > 1 
            if seamIndex == 1 
                area = [realmax, cumulativeEnergyMap(seamIndex, col - 1), cumulativeEnergyMap(seamIndex + 1, col - 1)];
            elseif seamIndex == height
                area = [cumulativeEnergyMap(seamIndex - 1, col - 1), cumulativeEnergyMap(seamIndex, col - 1), realmax];
            else
                area = [cumulativeEnergyMap(seamIndex - 1, col - 1), cumulativeEnergyMap(seamIndex, col - 1), cumulativeEnergyMap(seamIndex + 1, col - 1)];
            end
        end
    end
    horizontalSeam = retArray;
end

