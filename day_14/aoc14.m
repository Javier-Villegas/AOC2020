tic
fid = fopen('input.txt');

line = fgetl(fid);
N = length(line(8:end));
acc = 0;

container = containers.Map();
while line ~= -1
    if line(1:4) == "mask"
        mask = line(8:end);
        line = fgetl(fid);
    else
        while (line(1) ~= -1) && (line(1:3) == "mem")
            mem = dec2bin(str2double(line(strfind(line, ' = ')+3:end)),N);
            bin2dec(mem)
            mem(mask ~= 'X') = mask(mask~='X');
            container(line(5:strfind(line, ']')-1)) = bin2dec(mem)
            line = fgetl(fid);
        end
        
    end
end
acc = acc + sum(cell2mat(container.values));

toc
