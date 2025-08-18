inputImage = 'img.jpg';
encodedFile = 'Encoded.mat';
outputImage = 'Decoded.png';
function CenFenEncoding(inputImage, encodedFile)
    img = imread(inputImage);
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    
    [r, c] = size(img);
    sizeImg = [r, c];
    
    imgVector = [];
    for i = 1:r
        for j = 1:c
            imgVector(end+1,1) = img(i,j);
        end
    end
    encoded = [];
    count = 1;
    prev = imgVector(1);
    for i = 2:length(imgVector)
        if imgVector(i) == prev
            count = count + 1;
        else
            encoded(end+1,1) = prev;  
            encoded(end,2) = count;   
            prev = imgVector(i);
            count = 1;
        end
    end
    encoded(end+1,1) = prev;
    encoded(end,2) = count;
    save(encodedFile, 'encoded', 'sizeImg');
    
    disp("Encoding complete!");
end

function CenFenDecoding(encodedFile, outputImage)
    load(encodedFile, 'encoded', 'sizeImg');
    decoded = [];
    for i = 1:size(encoded,1)
        val = encoded(i,1);
        count = encoded(i,2);
        for k = 1:count
            decoded(end+1,1) = val;
        end
    end
    rows = sizeImg(1);
    cols = sizeImg(2);
    imgDecoded = zeros(rows, cols);
    idx = 1;
    for i = 1:rows
        for j = 1:cols
            imgDecoded(i,j) = decoded(idx);
            idx = idx + 1;
        end
    end
    imwrite(uint8(imgDecoded), outputImage);
    disp("Decoding complete!");
end

CenFenEncoding(inputImage, encodedFile);
CenFenDecoding(encodedFile, outputImage);
imshow(outputImage)
