ncdisp('SAVEX15_VLA1.nc');
pressure = ncread('SAVEX15_VLA1.nc', 'PRESSURE');

CTD01 = ncread('SAVEX15_VLA1.nc','CTD01');

long = CTD01(:,2); lat = CTD01(:,3);
pressure = CTD01(:,5);

[x,y,utmZone] = deg2utm(lat,long); 

plot_mat = [x(:) y(:) pressure(:)];

%[X,Y]=ndgrid(1:size(pressure,1),1:size(pressure,2 ));
%plot_mat = [X(:) Y(:) pressure(:)];
colorMat = addColor(plot_mat); 
pressureCloud =pointCloud(plot_mat,'Color',colorMat);
p = pcshow(pressureCloud);

