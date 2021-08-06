input = textscan(fopen('input.txt'),"%f\n");
input = input{1};
start = 1;
finish = 2;
while start <619 
    finish = start + 1;
    while finish < 620
        if sum(input(start:finish)) == input(620)
            break;
        end
        finish = finish + 1;
    end
    if sum(input(start:finish)) == input(620)
        break;
    end
    start = start + 1;
end
sum([min(input(start:finish)), max(input(start:finish))])