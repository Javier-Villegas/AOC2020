clear all
tic
luggage = fileread('input.txt');
luggage = split(luggage, newline);
bags = containers.Map();
for i=1:length(luggage)
    aux = split(luggage{i}, ' bags contain ');
    %M(aux{1}) = split(aux{2}, ', ');
    bags(aux{1}) = aux{2};
end
sum = 0;
containsShinyGold = {'shiny gold'};
last = 1;
total = containersMap();
while sum ~= last
    i = 1;
    last = sum;
    while i <= length(luggage)
        ind = strfind(luggage{i},' ');
        key = luggage{i}(1:ind(2)-1);
        if ~contains(key, containsShinyGold) && contains(bags(key), containsShinyGold)
            sum = sum+1;
            containsShinyGold(end+1) = {key};
        end

        i = i+1;
    end
end


sum
toc