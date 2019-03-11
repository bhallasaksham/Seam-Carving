function cumulativeEnergyMap = cumulative_min_energy_map(energyImg, seamDirection)
    if seamDirection == "VERTICAL" || seamDirection == "HORIZONTAL"
        if seamDirection == "HORIZONTAL"
            energyImg = fliplr(energyImg');
        end
        [height, width] = size(energyImg);
        cumulativeEnergyMap = energyImg;
        for row = 2:height
            for col = 1:width
                if col == 1
                    tempMin = min([cumulativeEnergyMap(row-1, col), cumulativeEnergyMap(row-1, col+1)]);
                elseif col == width
                    tempMin = min([cumulativeEnergyMap(row-1, col-1), cumulativeEnergyMap(row-1, col)]);
                else
                    tempMin = min([cumulativeEnergyMap(row-1, col-1), cumulativeEnergyMap(row-1, col), cumulativeEnergyMap(row-1, col+1)]);
                end
                cumulativeEnergyMap(row, col) = cumulativeEnergyMap(row, col) + tempMin;
            end
        end 
        if seamDirection == "HORIZONTAL"
            cumulativeEnergyMap = fliplr(cumulativeEnergyMap)';
        end
    end
end