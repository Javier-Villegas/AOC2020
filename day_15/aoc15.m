tic
input = [0,12,6,13,20,1,17];
input = containers.Map(input, 1:length(input));
newNumber = 0;
% input(newNumber) = 4;
% input(newNumber) = 0;
for i=length(input)+1:30000000-1
    if input.isKey(newNumber)
        aux = newNumber;
        newNumber = i-input(newNumber);
        input(aux) = i;
    else
        input(newNumber) = i;
        newNumber = 0;
    end
end
toc
newNumber
