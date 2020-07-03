function ptCloud = rotate(points, axis_x, axis_y)
%function takes in  N X 3 matrix points and rotates them to form disks
%   axis_x is the shift in the xaxis
% 
% points = [ x y ];
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

%coordinates = zeros(size(ptCloud,1) * size(zs,2),3);

fileID = fopen('nine.bin','w');

for i = 1: length(ys)
    for j = 1: length(zs) 
        fwrite(fileID,[ptCloud(i,1) ptCloud(i,2) zs(j,1)]);
    end
end
fclose(fileID);

readID = fopen('nine.bin');
coordinates = (fread(readID, [3 numRows/3]))'

topoPT = pointCloud(coordinates)
% pcshow(topoPT)