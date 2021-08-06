clear all
tic
luggage = fileread('input.txt');
luggage = split(luggage, newline);
bags = containers.Map();
for i=1:length(luggage)
    aux = split(luggage{i}, ' bags contain ');
    %M(aux{1}) = split(aux{2}, ', ');
    bags(aux{1}) = split(aux{2}, ', ');
end
sum = addBags(bags, bags('shiny gold'));
toc


