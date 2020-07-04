function a = get_pressure_points_from_figure(figure)
%get sound speed points from figure
 a = [];
for i = 1:size(figure.XData,1)
    for j = 1:size(figure.YData,1)
       row = [figure.XData(i,1) figure.YData(j,1) figure.CData(j,i)];
       a = [a; row] ;
    end 
end
end

