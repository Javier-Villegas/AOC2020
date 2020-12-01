tic
fid = fopen('aoc1.txt');
n = textscan(fid,'%d');
n = n{1};
fclose(fid);
n2 = circshift(n,1);
n3 = circshift(n2,1);
a = [];

for i=1:length(n)/2
    for k=1:length(n)/2
        aux = n+n2+n3 == 2020;
        a = [a,n(aux),n2(aux),n3(aux)];
        if any(aux)
            break;
        end
        n3 = circshift(n3,1);
    end
    n2 = circshift(n2,1);
end
a = unique(a);
fprintf("%d\n",prod(a))
toc