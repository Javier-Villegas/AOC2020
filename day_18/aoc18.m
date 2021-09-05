input = readlines('input.txt');

total = 0;
for i=1:numel(input)-1
    acc = operate(input{i});
    total = total + acc;
end

function res = operate(operation)
    res = 0;
    
    next_operator = find(operation == '*' | operation == '+',1,'first');
    
    if operation(1) == '('
%         a = operate(operation(1:next_operators(1)-3));
        [a,pos] = find_op(operation(1:end));
        a = operate(a);
        operation(1:pos) = '';
        operation = [num2str(a),operation];
        next_operator = numel(num2str(a))+2;
    else
        a = str2double(operation(1:next_operator-2));
    end
    
    if operation(next_operator+2) == '('
%         pos = next_operators(1)+3;
%         n_par = 1;
%         while n_par ~= 0
%             if operation(pos) == ')'
%                 n_par = n_par-1;
%                 if n_par == 0
%                     break;
%                 end
%             elseif operation(pos) == '('
%                 n_par = n_par+1;
%             end
%             pos = pos+1;
%         end
%         b = operate(operation(next_operators(1)+3:pos));
        [b,pos] = find_op(operation(next_operator+2:end));
        b = operate(b);
        operation(next_operator+1+(1:pos)) = '';
        operation = [operation(1:next_operator+1),num2str(b),operation(next_operator+2:end)];
    else
        pos = find(operation(next_operator+2:end) == ' ',1,'first');
        if ~isempty(pos)
            b = str2double(operation(next_operator+1+(1:pos)));
        else
            b = str2double(operation(next_operator+2:end));
        end
    end
    
    if operation(next_operator) == '*'
        res = a*b;
    elseif operation(next_operator) == '+'
        res = a+b;
    end
    
    %next_operator = find(operation == '*' | operation == '+',1,'first');
    operation = operation(next_operator+1:end);
    next_operator = find(operation == '*' | operation == '+',1,'first');
    
    if ~isempty(next_operator)
       operation = [num2str(res),operation(next_operator-1:end)];
       res = operate(operation);
    end
end

function [new_op, pos] = find_op(operation)
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