tic
clear all
input = textscan(fopen('input.txt'), "%f");
input = sort(input{1});
input = [0;input;max(input)+3];
%input = [0 1 2 3 4]
sum = accumulate(input, numel(input)) %#ok
toc

function acc = accumulate(input, k)
    persistent vis ac
    if isempty(vis)
       vis = zeros(1, numel(input));
       ac = vis;
    end
    acc = 0;
	if (k == 2) || (k == 3) || (k == 4)
        for i=1:3
            if (k-i > 1) && ((input(k)-input(k-i)) < 4) && vis(k-i)
                acc = acc + ac(k-i);
            elseif (k-i > 1) && ((input(k)-input(k-i)) < 4)
                ac(k-i) = accumulate(input,k-i);
                acc = acc + ac(k-i);
                vis(k-1) = 1;
            elseif (k-i > 0) && ((input(k)-input(k-i)) < 4)
                acc = acc + 1;
            end
        end
	else
        for i=1:3
            if (k-i > 0) && ((input(k)-input(k-i)) < 4) && vis(k-i)
                acc = acc + ac(k-i);
            elseif (k-i > 0) && ((input(k)-input(k-i)) < 4)
                ac(k-i) = accumulate(input,k-i);
                acc = acc + ac(k-i);
                vis(k-1) = 1;
            end
        end
	end
end
