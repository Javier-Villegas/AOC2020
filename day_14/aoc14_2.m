tic
fid = fopen('input.txt');

line = fgetl(fid);
N = length(line(8:end));
acc = 0;

container = containers.Map('KeyType', 'double', 'ValueType', 'double');
while line ~= -1
    if line(1:4) == "mask"
        mask = line(8:end);
        NX = sum(line == 'X');
        line = fgetl(fid);
    else
        while (line(1) ~= -1) && (line(1:3) == "mem")
            dir = dec2bin(str2double(line(5:strfind(line, ']')-1)),N);
            for i=0:2^NX-1
                aux = dir;
                aux(mask == 'X') = dec2bin(i,NX);
                aux(mask == '1') = mask(mask == '1');
                container(bin2dec(aux)) = str2double(line(strfind(line, ' = ')+3:end));
            end
            line = fgetl(fid);
        end
        
    end
end
acc = acc + sum(cell2mat(container.values));

toc
