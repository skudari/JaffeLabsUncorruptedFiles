zs = [1; 2 ; 3; 4; 5; 6; 7; 8];
ptCloud = [100 99 ; 98 97; 96 95; 94 93];

fileID = fopen('test.bin','w');

numRows = 0 
for i = 1:4
    for j = 1: length(zs) 
        fwrite(fileID,[ptCloud(i,1) ptCloud(i,2) zs(j,1)]);
        numRows = numRows + 3;
    end
end

fclose(fileID);

readID = fopen('test.bin');
A = (fread(readID, [3 numRows/3]))'

