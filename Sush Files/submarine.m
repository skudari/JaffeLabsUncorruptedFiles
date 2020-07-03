function [ellipse, cmatrix] = submarine(loc,x_rad,y_rad,z_rad,color)

[x, y, z] = ellipsoid(loc(1), loc(2), loc(3),x_rad,y_rad,z_rad,100);
ellipse = [x(:) y(:) z(:)];

cmatrix = ones(size(ellipse)).*color;
end