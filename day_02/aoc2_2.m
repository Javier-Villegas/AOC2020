tic
fid = fopen('aoc2.txt');
aux = textscan(fid,'%d-%d %c: %s');
fclose(fid);
aux = num2cell([num2cell(aux{1}), num2cell(aux{2}), num2cell(aux{3}), aux{4}],2);
res = sum(cellfun(@(x) (x{4}(x{1}) == x{3}) ~= (x{4}(x{2}) == x{3}), aux))
toc