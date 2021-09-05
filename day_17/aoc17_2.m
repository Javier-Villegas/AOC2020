fd = fopen('./input.txt');

input = textscan(fopen('input.txt'), '%s');
input = cell2mat(input{1});
n_cycles = 6;
combs = [  -1 -1 -1 -1;-1 -1 -1  1;-1 -1 -1  0;-1 -1  0 -1;-1 -1  0  1;-1 -1  0  0;
-1 -1  1 -1;-1 -1  1  1;-1 -1  1  0;-1  1 -1 -1;-1  1 -1  1;-1  1 -1  0;-1  1  0 -1;
-1  1  0  1;-1  1  0  0;-1  1  1 -1;-1  1  1  1;-1  1  1  0;-1  0 -1 -1;-1  0 -1  1;
-1  0 -1  0;-1  0  1 -1;-1  0  1  1;-1  0  1  0;-1  0  0 -1;-1  0  0  1;-1  0  0  0;

1 -1 -1 -1;1 -1 -1  1;1 -1 -1  0;1 -1  0 -1;1 -1  0  1;1 -1  0  0;1 -1  1 -1;
1 -1  1  1;1 -1  1  0;1  1 -1 -1;1  1 -1  1;1  1 -1  0;1  1  0 -1;1  1  0  1;
1  1  0  0;1  1  1 -1;1  1  1  1;1  1  1  0;1  0 -1 -1;1  0 -1  1;1  0 -1  0;
1  0  1 -1;1  0  1  1;1  0  1  0;1  0  0 -1;1  0  0  1;1  0  0  0;

0 -1 -1 -1;0 -1 -1  1;0 -1 -1  0;0 -1  0 -1;0 -1  0  1;0 -1  0  0;0 -1  1 -1;
0 -1  1  1;0 -1  1  0;0  1 -1 -1;0  1 -1  1;0  1 -1  0;0  1  0 -1;0  1  0  1;
0  1  0  0;0  1  1 -1;0  1  1  1;0  1  1  0;0  0 -1 -1;0  0 -1  1;0  0 -1  0;
0  0  1 -1;0  0  1  1;0  0  1  0;0  0  0 -1;0  0  0  1];


input = ['.#.';'..#';'###'];
      
center = n_cycles+1+1;
dimensions = repelem({repelem('.',size(input,1)+n_cycles*2+2, size(input,2)+n_cycles*2+2)},2*n_cycles+1+2,2*n_cycles+1+2);
dimensions{n_cycles+2,n_cycles+2}(n_cycles+2:n_cycles+size(input,1)+1,n_cycles+2:n_cycles+size(input,2)+1) = input;
% For each cycle
for i=1:6
    new_dims = dimensions;
    for w=center-i:center+i
        for z=center-i:center+i
            for x=(n_cycles+1-i:n_cycles+size(input,1)+i)+1
                for y=(n_cycles+1-i:n_cycles+size(input,2)+i)+1

                    num_active = 0;
                    n = 1;
                    while num_active < 4 && n < 81
                        if dimensions{w+combs(n,1),z+combs(n,2)}(y+combs(n,3),x+combs(n,4)) == '#'
                            num_active = num_active+1;
                        end
                        n = n+1;
                    end



                    if dimensions{w,z}(y,x) == '#' && ~(num_active == 2 || num_active == 3)
                        new_dims{w,z}(y,x) = '.';
                    elseif dimensions{w,z}(y,x) == '.' && num_active == 3
                        new_dims{w,z}(y,x) = '#';
                    end

                end

            end
        end
    end
    dimensions = new_dims;
end
total = 0;
for i=1:size(dimensions,1)
    for j=1:size(dimensions,2)
        total = total+nnz(dimensions{i,j} == '#');
    end
end
