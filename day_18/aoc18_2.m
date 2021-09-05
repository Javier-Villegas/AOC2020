input = readlines('input.txt');

total = 0;
acc = 0;
for i=1:numel(input)-1
    acc = operate(input{i});
    total = total + acc;
end


function res = operate(operation)
    % Search and resolve parenthesis first
    pos_par = find(operation == '(',1,'first');
    while ~isempty(pos_par)
        
        [new_op, pos] = find_operation(operation(pos_par:end));
        par_res = operate(new_op);
        operation(pos_par+(1:pos)-1) = '';
        operation = [operation(1:pos_par-1), num2str(par_res), operation(pos_par:end)];
        
        pos_par = find(operation == '(',1,'first');
    end
    
    
    pos_sum = find(operation == '+',1,'first');
    while ~isempty(pos_sum)
        [a,b,pos_a,pos_b] = find_operators(operation, pos_sum);

        res = a+b;
        operation(pos_sum-pos_a:pos_sum+pos_b) = '';
        operation = [   operation(1:pos_sum-2-numel(num2str(a))),...
                        num2str(res),...
                        operation(pos_sum-numel(num2str(a))-1:end)];
                    
        pos_sum = find(operation == '+',1,'first');
    end
    
    pos_mul = find(operation == '*',1,'first');
    while ~isempty(pos_mul)
        [a,b,pos_a,pos_b] = find_operators(operation, pos_mul);
        
        res = a*b;
        operation(pos_mul-pos_a:pos_mul+pos_b) = '';
        operation = [   operation(1:pos_mul-2-numel(num2str(a))),...
                        num2str(res),...
                        operation(pos_mul-numel(num2str(a))-1:end)];
                    
        pos_mul = find(operation == '*',1,'first');
    end
    
    
end


function [new_op, pos] = find_operation(operation)
    pos = 2;
    n_par = 1;
    while n_par ~= 0
        if operation(pos) == ')'
            n_par = n_par-1;
            if n_par == 0
                break;
            end
        elseif operation(pos) == '('
            n_par = n_par+1;
        end
        pos = pos+1;           
    end
    new_op = operation(2:pos-1);
end

function [a,b,pos_a,pos_b] = find_operators(operation, pos)
% operator a
        pos_a = find(operation(pos-2:-1:1) == ' ',1,'first');
        if ~isempty(pos_a)                
            a = str2double(operation(pos-(pos_a:-1:2)));
        else 
            pos_a = pos - 1;
            a = str2double(operation(1:pos-2));
        end

        % operator b
        pos_b = find(operation(pos+2:end) == ' ',1,'first');
        if ~isempty(pos_b)
            b = str2double(operation(pos+(2:pos_b)));
        else 
            pos_b = numel(operation)-pos;
            b = str2double(operation(pos+2:end));
        end
end