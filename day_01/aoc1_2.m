tic
fid = fopen('aoc1.txt');
n = textscan(fid,'%d');
n = n{1};
fclose(fid);
n2 = wshift('1d', n);
n3 = wshift('1d',n2);
a = [];

for i=1:length(n)/2
    for k=1:length(n)/2
        aux = n+n2+n3 == 2020;
        a = [a,n(aux),n2(aux),n3(aux)];
        if any(aux)
            break;
        end
        n3 = wshift('1d', n3);
    end
    n2 = wshift('1d', n2);
end
a = unique(a);
fprintf("%d\n",prod(a))
toc