tic
fid = fopen('aoc1.txt');
n = textscan(fid,'%d');
n = n{1};
fclose(fid);
n2 = wshift('1d', n);
a = [];
b = [];
for i=1:length(n)/2
    aux = n+n2 == 2020;
    a = [a,n(aux),n2(aux)];
    if any(aux)
        break;
    end
    n2 = wshift('1d', n2);
end
a = unique(a);
fprintf("%d\n", prod(a));
toc