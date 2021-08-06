tic
input = textscan(fopen('input.txt'), "%f");
input = sort(input{1});
input = [0;input];
deviceJoltage = max(input)+3;
diff1 = 0;
diff3 = 1;
for i=numel(input):-1:2
    aux = input(i)-input(i-1);
    if aux == 1
        diff1 = diff1 + 1;
    elseif aux == 3
        diff3 = diff3 + 1;
    end
end
diff1*diff3
toc

