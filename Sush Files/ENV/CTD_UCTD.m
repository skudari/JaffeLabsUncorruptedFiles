%% 
% Script will write 28 .PLY files of the pressure clouds and then plot 
%   them onto a flat bottom topography

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
% Write ply files for all 26 CTD's 
for i = 1:26
    %hadle to figure
    if( i < 10) 
        header = 'CTD0'
    else
        header = 'CTD'
    end
    figure = plotshd([header int2str(i) '.shd']); 
    a = get_pressure_points_from_figure(figure)
    %a = rotate(a)

    %add color to both topo and sound speed 
    colorMatCoor = addColor(topoCoordinates);
    colorMatPressure = addColor(a);

    %scale matrix to fit onto topograpy 
    a(:,1) = a(:,1) + 504000;
    a(:,2) = a(:,2) + 7038881;

    %plot both topography and pressure
    topoPT = pointCloud(topoCoordinates,'Color',colorMatCoor);
    pressureCloud = pointCloud(a,'Color',colorMatPressure);
    
    pcwrite(pressureCloud,[header int2str(i)],'PLYFormat','binary');

    figure()
    p = pcshowpair(topoPT,pressureCloud);
    %p = pcshow(ptCloud);
    %p = pcshow(pressureCloud);
end