tic
input = textscan(fopen('input.txt'), '%s');
ref_time = str2double(input{1}{1});
aux = split(input{1}{2}, ',');
buses = [];
for i=1:length(aux)
    if aux{i} ~= 'x'
        buses(end+1,:) = [str2double(aux{i}) i-1];
    end
end
lcm = 1;
timestamp = 0;
for i=1:length(buses)-1
   bus = buses(i+1,1);
   offset = buses(i+1,2);
   lcm = lcm*buses(i,1);
   while mod(timestamp+offset,bus) ~= 0
       timestamp = timestamp + lcm;
   end
end

