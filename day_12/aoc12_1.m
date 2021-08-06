tic
input = textscan(fopen('test.txt'), "%c%f");

x=0;y=0;dir=0;
for i=1:size(input{1},1)
    switch input{1}(i)
        case 'N'
            y = y+input{2}(i);
        case 'S'
            y = y-input{2}(i);
        case 'E'
            x = x+input{2}(i);
        case 'W'
            x = x-input{2}(i);
        case 'L'
            dir = dir+input{2}(i);
        case 'R'
            dir = dir-input{2}(i);
        case 'F'
            x = x + input{2}(i)*cosd(dir);
            y = y + input{2}(i)*sind(dir);
    end       
end
x,y,
toc