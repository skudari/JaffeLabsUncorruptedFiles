%
%FILE DIRECTORY 
%
% ENV Directory:
%       % bottomBathymetry -- an averaged flat bottom bathymetry for the
%           East China Sea
%       % CTD01.env + .prt + .shd +.ply
%       % CTD02.env + .prt + .shd +.ply
%       % CTD03.env + .prt + .shd +.ply
%       % CTD04.env + .prt + .shd +.ply
%       % CTD05.env + .prt + .shd +.ply
%       % CTD06.env + .prt + .shd +.ply
%       % CTD07.end + .prt + .shd +.ply
%       % CTD08.end + .prt + .shd +.ply
%       % CTD09.end + .prt + .shd +.ply
%       % CTD10.end + .prt + .shd +.ply
%       % CTD11.env + .prt + .shd +.ply
%       % CTD12.env + .prt + .shd +.ply
%       % CTD13.env + .prt + .shd +.ply
%       % CTD14.env + .prt + .shd +.ply
%       % CTD15.env + .prt + .shd +.ply
%       % CTD16.env + .prt + .shd +.ply
%       % CTD17.end + .prt + .shd +.ply
%       % CTD18.end + .prt + .shd +.ply
%       % CTD19.end + .prt + .shd +.ply
%       % CTD20.end + .prt + .shd +.ply
%       % CTD21.env + .prt + .shd +.ply
%       % CTD22.env + .prt + .shd +.ply
%       % CTD23.env + .prt + .shd +.ply
%       % CTD24.env + .prt + .shd +.ply
%       % CTD25.env + .prt + .shd +.ply
%       % CTD26.env + .prt + .shd +.ply
%       % 
%       % NOTE: .ply are the point cloud objects of only the pressureCloud
%           all are scaled by  x = 504000 y = 7038881
%       %
%       % CTD_UCTD.m -- runs CTD information for all 26 arrays and
%       generates .ply files
%       % template.env + .prt + .shd -- sample env template and the outcome
%           shade and print file (can be copied and changed)
%
% addColor.m - function takes in a (n x 3) x y z matrix and adds color by
%              normalizing by the z value
%
% c_water.m - calculates sound speed (in m/s) of seawater given T (°C), P (kPa)
%               
% deg2utm.m - convert lat/lon vectors into UTM coordinates 
%
% Depth.m - Computes depth given the pressure at some latitude
%
% get_ENV_data.M -- calculates the depth and ssp for any given CTD item 
%
% get_pressure_points_from_figure -- takes in a figure and calculates
%                                       pressure gradient
%
% rotate.m - takes two points and rotates them in  360 degree cylinder
%
% SACEX15_VLA1.m - works the same as CTD_UCTD.m but for VLA
%
% submrine.m - generates a elleptical sphere to represent a submarine
%
% test.bin -- file that is written to from CTD_UCTD.m, contains the rotated
%           pressure points (heavy memory and space usage script)
%% HOW TO RUN 
%
% 1. Add all files and subfiles in at 2 folder to path 
% 2. Navigate to at 2/tests/wedge/Sush Files/ENV Folder
% 3. Run get_ENV_data(<CTD FILE>)
% 4. Copy and paste the ouput ssp and depth into the .env file template and
%       adjust the required settings
% 3. bellhop <CTD FILE>.env -- will produce a shade and print file 
%   If all the runs are correct, the print file should show no errors
% 4. Run CTD_UCTD.m -- should produce 26 3D point cloud images for their
% respective CTD arrays
%       %   If you uncomment rotate(pointCloud)
%   To save time avoid re-runing, use the exiting .env file and just run
% step 4. 
% 
