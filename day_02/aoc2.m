tic
fid = fopen('aoc2.txt');
aux = textscan(fid,'%d-%d %c: %s');
fclose(fid);
min = aux{1}; max = aux{2}; ch = aux{3}; pass = char(aux{4});
aux = sum(ch == pass, 2);
res = sum((aux <= max) & (aux >= min))
toc