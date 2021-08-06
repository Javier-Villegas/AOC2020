input = textscan(fopen('input.txt'),"%f\n");
input = input{1};

for i=26:numel(input)
    aux = input(i) - input(1:(i-1));
    for k=1:numel(aux)
        a = input(1:(i-1)) == aux(k);
        if any(a)
            break;
        end
    end
    if ~any(a)
        break;
    end
end