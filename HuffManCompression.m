inputImage = 'img.jpg';
encodedFile = 'huffman_compressed.mat';
outputImage = 'huffman_reconstructed.png';
function huffman_encode(inputImage, encodedFile)
    img = imread(inputImage);
    if ndims(img) == 3
        img = rgb2gray(img);
    end
    [rows, cols] = size(img);
    sizeImg = [rows, cols];
    
    imgVector = [];
    for i = 1:rows
        for j = 1:cols
            imgVector(end+1,1) = img(i,j);
        end
    end
    
    symbols = [];
    freq = [];
    for i = 1:length(imgVector)
        val = imgVector(i);
        idx = find(symbols == val, 1);
        if isempty(idx)
            symbols(end+1) = val;
            freq(end+1) = 1;
        else
            freq(idx) = freq(idx) + 1;
        end
    end
    
    prob = freq / sum(freq);
    
    nodes = num2cell(symbols); 
    weights = prob;             
    
    codes = containers.Map('KeyType','double','ValueType','any');
    for i = 1:length(symbols)
        codes(symbols(i)) = '';  
    end
    
    while length(weights) > 1
        [~, idx1] = min(weights);
        w1 = weights(idx1); n1 = nodes{idx1};
        weights(idx1) = []; nodes(idx1) = [];
        
        [~, idx2] = min(weights);
        w2 = weights(idx2); n2 = nodes{idx2};
        weights(idx2) = []; nodes(idx2) = [];
        
        for i = 1:length(n1)
            codes(n1(i)) = ['0' codes(n1(i))];
        end
        for i = 1:length(n2)
            codes(n2(i)) = ['1' codes(n2(i))];
        end
        
        nodes{end+1} = [n1 n2];
        weights(end+1) = w1 + w2;
    end
    
    bitstream = '';
    for i = 1:length(imgVector)
        bitstream = [bitstream codes(imgVector(i))];
    end
    
    save(encodedFile, 'bitstream', 'codes', 'sizeImg');
    disp("Huffman encoding complete!");
end


function huffman_decode(encodedFile, outputImage)
    load(encodedFile, 'bitstream', 'codes', 'sizeImg');
    
    keys = codes.keys;
    values = codes.values;
    revCodes = containers.Map;
    for i = 1:length(keys)
        revCodes(values{i}) = keys{i};
    end
    
    decoded = [];
    buffer = '';
    for i = 1:length(bitstream)
        buffer = [buffer bitstream(i)];
        if isKey(revCodes, buffer)
            decoded(end+1) = revCodes(buffer);
            buffer = '';
        end
    end
    
    rows = sizeImg(1); cols = sizeImg(2);
    imgDecoded = zeros(rows, cols);
    idx = 1;
    for i = 1:rows
        for j = 1:cols
            imgDecoded(i,j) = decoded(idx);
            idx = idx + 1;
        end
    end
    
    imwrite(uint8(imgDecoded), outputImage);
    disp("Huffman decoding complete!");
end

huffman_encode(inputImage, encodedFile);

huffman_decode(encodedFile, outputImage);
