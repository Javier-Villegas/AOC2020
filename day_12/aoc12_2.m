tic
input = textscan(fopen('input.txt'), "%c%f");
waypoint = [10;1];
pos = [0;0];
for i=1:length(input{1})
    switch input{1}(i)
        case 'N'
            waypoint(2) = waypoint(2)+input{2}(i);
        case 'S'
            waypoint(2) = waypoint(2)-input{2}(i);
        case 'E'
            waypoint(1) = waypoint(1)+input{2}(i);
        case 'W'
            waypoint(1) = waypoint(1)-input{2}(i);
        case 'L'    % Counter-clockwise
            waypoint = [cosd(input{2}(i)),-sind(input{2}(i));...
                        sind(input{2}(i)),cosd(input{2}(i))]*...
                        waypoint;
        case 'R'    % Clockwise
            waypoint = [cosd(input{2}(i)),sind(input{2}(i));...
                        -sind(input{2}(i)),cosd(input{2}(i))]*...
                        waypoint;
        case 'F'
            pos = pos+waypoint*input{2}(i);
        otherwise
            continue;
    end       
end
sum(abs(pos))
toc