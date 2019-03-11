function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
    [height, width] = size(cumulativeEnergyMap);
    retArray = zeros(height, 1);
    index = height;
    area = cumulativeEnergyMap(height,:);
    [~ ,location] = min(area);
    seamIndex = location;
    retArray(index) = seamIndex;
    index = index - 1;
    if seamIndex == 1 
        area = [realmax, cumulativeEnergyMap(height - 1, seamIndex), cumulativeEnergyMap(height - 1, seamIndex + 1)];
    elseif seamIndex == width
        area = [cumulativeEnergyMap(height - 1, seamIndex - 1), cumulativeEnergyMap(height - 1, seamIndex), realmax];
    else
        area = [cumulativeEnergyMap(height - 1, seamIndex - 1), cumulativeEnergyMap(height - 1, seamIndex), cumulativeEnergyMap(height - 1, seamIndex + 1)];
    end
    for row = height-1:-1:1
        [~, location] = min(area);
        if location == 1
            seamIndex = seamIndex - 1;
        elseif location == 3
            seamIndex = seamIndex + 1;
        end
        retArray(index) = seamIndex;
        index = index - 1;
        if row > 1
            if seamIndex == 1 
                area = [realmax, cumulativeEnergyMap(row - 1, seamIndex), cumulativeEnergyMap(row - 1, seamIndex + 1)];
            elseif seamIndex == width
                area = [cumulativeEnergyMap(row - 1, seamIndex - 1), cumulativeEnergyMap(row - 1, seamIndex), realmax];
            else
                area = [cumulativeEnergyMap(row - 1, seamIndex - 1), cumulativeEnergyMap(row - 1, seamIndex), cumulativeEnergyMap(row - 1, seamIndex + 1)];
            end
        end
    end
    verticalSeam = retArray;
end

