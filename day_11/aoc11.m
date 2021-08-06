
tic
aux = textscan(fopen('input.txt'), '%s');
aux = cell2mat(aux{1});
input = zeros(size(aux)+2);
copy = input;
input(2:end-1,2:end-1) = aux;
ady = [[-1,-1];[-1,0];[-1,1];[0,-1];[0,1];[1,1];[1,0];[1,-1]];
input(input == 'L') = '#';
[indI, indJ] = find(input == '#');
while any(copy ~= input,[1 2])
    copy = input;
    for i=1:numel(indI)
        ocupied = 0;
        for k=1:size(ady,1)
            if copy(indI(i)+ady(k,1),indJ(i)+ady(k,2)) == '#'
                ocupied = ocupied + 1;
            end
            if ocupied == 4
                input(indI(i),indJ(i)) = 'L';
                break;
            end
        end
        if ocupied == 0
            input(indI(i),indJ(i)) = '#';
        end
    end
    
end
sum(input == '#',[1 2])
toc