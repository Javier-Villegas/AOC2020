tic
aux =fileread('input.txt');

aux = strsplit(aux, '\n\n');
aux = cellfun(@(x) replace(x, '\n', ' '), aux, 'UniformOutput', false);
a = 0;
%key = ["ecl:(gry|)";"pid:[0-9]+";"eyr:[0-9]{4}";"hcl:#[a-f|0-9]{6}";"byr:[0-9]{4}";"iyr:[0-9]{4}";"hgt:[0-9]+cm"];
key = ["ecl";"pid";"eyr";"hcl";"byr";"iyr";"hgt"];
sum(cellfun(@(x) ~any([isempty(regexp(x,key(1),'ONCE')),...
    isempty(regexp(x,key(2),'ONCE')),...
    isempty(regexp(x,key(3),'ONCE')),...
    isempty(regexp(x,key(4),'ONCE')),...
    isempty(regexp(x,key(5),'ONCE')),...
    isempty(regexp(x,key(6),'ONCE')),...
    isempty(regexp(x,key(7),'ONCE'))]),...
    aux))
toc