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
tickets = [];
while line(1) ~= -1
    ticket = str2num(line); %#ok
    for i=1:N
        valid = true;
        for j=1:N
            ranges = classes(fields(j));
            if (((ticket(i)>=ranges(1,1))&&(ticket(i)<=ranges(1,2)))||...
                    ((ticket(i)>=ranges(2,1))&&(ticket(i)<=ranges(2,2))))
                break;
            end
            if j == N
                valid = false;
            end
        end
        if ~valid
           break;
        end
    end
    if valid
       tickets(end+1,:) = ticket; %#ok 
    end
    line = fgetl(fid);
end

sel = [];
for i=1:N
    ranges = classes(fields(i));
    sel(end+1,:) = all((((tickets>=ranges(1,1))&(tickets<=ranges(1,2)))|...
                ((tickets>=ranges(2,1))&(tickets<=ranges(2,2))))); %#ok
end
order = [];
pair = [];
while numel(order) ~= N
    ind = find(sum(sel,2) == 1);
    order = [order, ind]; %#ok
    for i=1:numel(ind)
        pair(end+1,:) = [ind(i),find(sel(ind(i),:)==1)];
        sel(:,sel(ind(i),:)==1) = 0;%#ok
    end
end
toc