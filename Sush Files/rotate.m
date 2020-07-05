function ptCloud = rotate(points, axis_x, axis_y, CTD_num)
%function takes in  N X 3 matrix points and rotates them to form disks
%   axis_x is the shift in the xaxis
%   axis_y is the shift in the yaxis
%   CTD_num is the name of the .bin file to be written (use CTD number)
%
% points = [ 1 1 0; 3 2 9; 0 1 8; -1 5 6; 9 0 0]

% figure()
% scatter(points(:,1), points(:,2));

%change axis to recenter
% axis_x = 7;
% axis_y = 3;

Rs = sqrt(sum(points .^ 2, 2));

xs = [(Rs .* cos(0:1:10*pi));(Rs .* cos(0:1:10*pi)); 
     (Rs .* -cos(0:1:10*pi));(Rs .* -cos(0:1:10*pi))];
ys = [(Rs .* sin(0:1:10*pi));(Rs .* -sin(0:1:10*pi));
      (Rs .* sin(0:1:10*pi));(Rs .* -sin(0:1:10*pi))];
zs = points(:,3);


ptCloud = zeros(size(ys,1) * size(xs,2),2);
ptCloud(:,1) = xs(:) + axis_x;
ptCloud(:,2) = ys(:) + axis_y;


fileID = fopen([CTD_num '.bin'],'w');

numRows = 0
%a = [];
for i = 1: length(ys)
    for j = 1: length(zs) 
        fwrite(fileID,[ptCloud(i,1) ptCloud(i,2) zs(j,1)],'double');
        %a = [a; ptCloud(i,1) ptCloud(i,2) zs(j,1)];
        numRows = numRows + 1; 
    end
end
fclose(fileID);

% ptClouda = pointCloud(a)
% pcshow(ptClouda)

readID = fopen([CTD_num '.bin']);
coordinates = (fread(readID, [3 numRows], 'double'))';

figure()
ptCloud = pointCloud(coordinates)
pcshow(ptCloud)