tic
fid = fopen('aoc1.txt');
n = textscan(fid,'%d');
n = n{1};
fclose(fid);
n2 = circshift(n,1);
a = [];
b = [];
for i=1:length(n)/2
    aux = n+n2 == 2020;
    a = [n(aux),n2(aux)];
    if any(aux)
        break;
    end
    n2 = circshift(n2,1);
end
fprintf("%d\n", prod(a));
toc