tic
fid = fopen('input.txt');
aux = textscan(fid,'%s');
l = length(aux{1}{1});
fclose(fid);
res = [0 0 0 0];
res2 = 0;
slopes = [1 3 5 7];
j = [1 1 1 1];
j2 = 1;
for i=1:length(aux{1})
    if aux{1}{i}(j(1)) == '#'
        res(1) = res(1)+1;
    end    
    j(1) = j(1)+slopes(1);
    if j(1) > l
        j(1) = j(1)-l;
    end
    
    if aux{1}{i}(j(2)) == '#'
        res(2) = res(2)+1;
    end
    j(2) = j(2)+slopes(2);
    if j(2) > l
        j(2) = j(2)-l;
    end
    
    if aux{1}{i}(j(3)) == '#'
        res(3) = res(3)+1;
    end
    j(3) = j(3)+slopes(3);
    if j(3) > l
        j(3) = j(3)-l;
    end
    
    if aux{1}{i}(j(4)) == '#'
        res(4) = res(4)+1;
    end
    j(4) = j(4)+slopes(4);
    if j(4) > l
        j(4) = j(4)-l;
    end
    
    if mod(i,2) == 1
        if aux{1}{i}(j2) == '#'
            res2 = res2+1;
        end
        j2 = j2+1;
        if j2 > l
            j2 = j2-l;
        end
    end
end
l ~= 1    ; %#ok
a= l +1;
prod([res,res2])
[res,res2] %#ok