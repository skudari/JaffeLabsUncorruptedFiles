%%
%Get CTD 1 data 
function [depth_and_ssp] = get_ENV_data(CTD_num)
CTD01 = ncread('SAVEX15_CTD.nc', CTD_num);


long = CTD01(:,2); lat = CTD01(:,3);
pressure = CTD01(:,4)/10; %kPa
temp = CTD01(:,5); %C
salinity = CTD01(:,6); %In PSU but c_water need ppt (nearly same?)

%calculate sound speed
soundSpeed = c_water(temp,pressure,salinity); %m/s

%convert long and lat to x and y 
[x,y,utmZone] = deg2utm(lat,long); 

%find depth for each ssp
depth = Depth(pressure, lat);

%concanate coordinates and sound speed (for plotting)
plot_mat = [x(:) y(:) soundSpeed(:)]; 

%depth and ssp (for bellhop)
format long g
depth_and_ssp= [depth soundSpeed];