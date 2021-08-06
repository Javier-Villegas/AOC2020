tic
input = textscan(fopen('input.txt'), '%s');
ref_time = str2double(input{1}{1});
buses = replace(input{1}{2}, ',',' ');
buses = str2num(replace(buses, 'x',''));
buses(2,:) = 0;
for i=1:length(buses)
    aux = 0:buses(1,i):ref_time+buses(1,i);
    buses(2,i) = aux(end);
end
[~,ind] = min(buses(2,:));
(buses(2,ind)- ref_time)*buses(1,ind)
toc