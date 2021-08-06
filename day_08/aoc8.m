tic
instructions = split(fileread('input.txt'), newline);
execInstructions = zeros(1,length(instructions));
accumulator = 0;
pc = 1;
i = 1;
while ~execInstructions(end)
    if instructions{i}(1:3) == "jmp" 
        instructions{i}(1:3) = 'nop';
    elseif instructions{i}(1:3) == "nop"
        instructions{i}(1:3) = 'jmp';
    else
        i = i+1;
        continue;
    end
    execInstructions = zeros(1,length(instructions));
    pc = 1;
    accumulator = 0;
    while pc <= length(instructions)
        execInstructions(pc) = 1;
        switch (instructions{pc}(1:3))
            case 'acc'
                accumulator = accumulator + str2double(instructions{pc}(5:end));
                pc = pc + 1;
            case 'jmp'
                pc = pc + str2double(instructions{pc}(5:end));
            otherwise
                pc = pc+1;
        end   
        if pc <= length(instructions) && execInstructions(pc)
            break;
        end
    end
    if execInstructions(end)
        accumulator %#ok
        break;
    elseif instructions{i}(1:3) == "jmp" 
        instructions{i}(1:3) = 'nop';
    elseif instructions{i}(1:3) == "nop"
        instructions{i}(1:3) = 'jmp';
    end
    i = i+1;
end 
toc 