%%
%Topography of sea floor
canyon = load('INIT.MAT');
topo = canyon.siocanyon;
lat = topo(:,1); 
lon = topo(:,2); 
z = topo(:,3); 

%x y points
[x,y,utmzone] = deg2utm(lat,lon);

%level out bottom trench
avg = mean(z)
z(z < avg) = avg;
topoCoordinates = [x y z];

%%

%hadle to figure
figure = plotshd('CTD01.shd'); 

%get sound speed points from figure
 a = [];
for i = 1:size(figure.XData,1)
    for j = 1:size(figure.YData,1)
       row = [figure.XData(i,1) figure.YData(j,1) figure.CData(j,i)];
       a = [a; row] ;
    end 
end
rotated_pressure = rotate(a)

%add color to both topo and sound speed 
colorMatCoor = addColor(topoCoordinates);
%colorMatPressure = addColor(rotated_pressure);

%scale matrix to fit onto topograpy 
a(:,1) = a(:,1) + 504000;
a(:,2) = a(:,2) + 7038881;

%plot both topography and pressure
topoPT = pointCloud(topoCoordinates,'Color',colorMatCoor);
pressureCloud = pointCloud(rotated_pressure) %,'Color',colorMatPressure);

p = pcshowpair(topoPT,pressureCloud);
%p = pcshow(ptCloud);
%p = pcshow(pressureCloud);