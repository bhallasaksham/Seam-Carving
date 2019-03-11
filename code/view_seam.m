function view_seam(im,seam,seamDirection)
    [height, width, ~] = size(im);
    if seamDirection == "VERTICAL"
        for row = 1:height
            im(row, seam(row), 1) = 255;
            im(row, seam(row), 2) = 0;
            im(row, seam(row), 3) = 0;
        end
    end

    if seamDirection == "HORIZONTAL"
        for col = 1:width
            im(seam(col), col, 1) = 255;
            im(seam(col), col, 2) = 0;
            im(seam(col), col, 3) = 0;
        end
    end
    imshow(im)
end