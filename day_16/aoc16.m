close all
clear all
tic

fid = fopen('input.txt');
line = fgetl(fid);
classes = containers.Map();
ranges = zeros(2,2);
fields = "";

while ~isempty(line)
    colon = find(line == ':');
    dashes = find(line == '-');
    or = strfind(line," or ");
    fields(end+1) = line(1:colon-1); %#ok
    ranges(1,1) = str2double(line(colon+2:dashes(1)-1));
    ranges(1,2) = str2double(line(dashes(1)+1:or-1));
    ranges(2,1) = str2double(line(or+4:dashes(2)-1));
    ranges(2,2) = str2double(line(dashes(2)+1:end));
    classes(fields(end)) = ranges;
    line = fgetl(fid);
end
fields(1) = [];

fgetl(fid);
myticket = str2num(fgetl(fid)); %#ok

acc = 0;
N = numel(fields);
fgetl(fid); fgetl(fid);
line = fgetl(fid);

while line(1) ~= -1
    ticket = str2num(line); %#ok
    for i=1:N
        for j=1:N
            ranges = classes(fields(j));
            if (((ticket(i)>=ranges(1,1))&&(ticket(i)<=ranges(1,2)))||...
                    ((ticket(i)>=ranges(2,1))&&(ticket(i)<=ranges(2,2))))
                break;
            end
            if j==N
                acc = acc + ticket(i);
            end
            
        end
    end
    line = fgetl(fid);
end
toc