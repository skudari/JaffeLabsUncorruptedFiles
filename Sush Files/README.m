%
%FILE DIRECTORY 
%
% ENV Directory:
%       % CTD01.env + .prt + .shd
%       % CTD02.env + .prt + .shd
%       % CTD03.env + .prt + .shd
%       % CTD04.env + .prt + .shd
%       % CTD05.env + .prt + .shd
%       % CTD06.env + .prt + .shd
%       % CTD07.end + .prt + .shd
%       % CTD08.end + .prt + .shd
%       % CTD09.end + .prt + .shd
%       % CTD10.end + .prt + .shd
%       % CTD11.env + .prt + .shd
%       % CTD12.env + .prt + .shd
%       % CTD13.env + .prt + .shd
%       % CTD14.env + .prt + .shd
%       % CTD15.env + .prt + .shd
%       % CTD16.env + .prt + .shd
%       % CTD17.end + .prt + .shd
%       % CTD18.end + .prt + .shd
%       % CTD19.end + .prt + .shd
%       % CTD20.end + .prt + .shd
%       % CTD21.env + .prt + .shd
%       % CTD22.env + .prt + .shd
%       % CTD23.env + .prt + .shd
%       % CTD24.env + .prt + .shd
%       % CTD25.env + .prt + .shd
%       % CTD26.env + .prt + .shd
%
%
% addColor.m - function takes in a (n x 3) x y z matrix and adds color by
%              normalizing by the z value
%
% c_water.m - calculates sound speed (in m/s) of seawater given T (�C), P (kPa)
%
% CTD_UCTD.m - Will plot topograph and sounds speed, for now plots East
%              China Sea CTD data on a flat bottom
%               
% deg2utm.m - convert lat/lon vectors into UTM coordinates 
%
% Depth.m - Computes depth given the pressure at some latitude
%
% EastChinaSea.m -
%
% ECS.shd - shade file used for pressure coordinates in CTD_UCTD.m
%
% get_ENV_data.M -- calculates the depth and ssp for any given CTD item 
%
% rotate.m - takes two points and rotates them in  360 degree cylinder
%
% SACEX15_VLA1.m - works the same as CTD_UCTD.m but for VLA
%
% submrine.m - generates a elleptical sphere to represent a submarine
%
%% HOW TO RUN 
%
% 1. Add all files and subfiles in at 2 folder to path 
% 2. Navigate to at 2/tests/wedge/Sush Files
% 3. bellhop ECS.env -- will produce a shade and print file 
%   If all the runs are correct, the print file should show no errors
% 4. Run CTD_UCTD.m -- should produce a 3D point cloud
%   To save time avoid re-runing, use the exiting .env file and just run
% step 4. 
% 
