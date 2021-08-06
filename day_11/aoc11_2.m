tic
aux = textscan(fopen('input.txt'), '%s');
aux = cell2mat(aux{1});
input = zeros(size(aux)+2);
copy = input;
input(2:end-1,2:end-1) = aux;
ady = [[-1,-1];[-1,0];[-1,1];[0,-1];[0,1];[1,1];[1,0];[1,-1]];
input(input == 'L') = '#';
[x,y] = size(input);
while any(copy ~= input,[1 2])
    copy = input;
    [indI, indJ] = find(input == '#');
    for i=1:numel(indI)
        ocupied = 0;
        for k=1:8
            for o=1:y
                indexi = indI(i)+o*ady(k,1);
                indexj = indJ(i)+o*ady(k,2);
                if (indexi > 1) && (indexj > 1) && (indexi < x) && (indexj < y)
                    if copy(indexi,indexj) == 'L'
                        break;
                    elseif copy(indexi,indexj) == '#'
                    	ocupied = ocupied+1;
                        break;
                    end
                end
            end
            if ocupied >= 5
                input(indI(i),indJ(i)) = 'L';
                break;
            end
        end
    end
    copy = input;
    [indI, indJ] = find(input == 'L');
    for i=1:numel(indI)
        ocupied = 0;
        for k=1:8
            for o=1:y
                indexi = indI(i)+o*ady(k,1);
                indexj = indJ(i)+o*ady(k,2);
                if (indexi > 1) && (indexj > 1) && (indexi < x) && (indexj < y)
                    if copy(indexi,indexj) == 'L' 
                        break;
                    elseif copy(indexi,indexj) == '#'
                        ocupied = ocupied+1;
                        break;
                    end
                end
            end
            if ocupied
               break; 
            end
        end
        if ~ocupied
            for k=1:size(possibleSeats,1)
               input(indI(i),indJ(i)) = '#';
            end
        end
        
    end
    
end
sum(input == '#',[1 2])
toc