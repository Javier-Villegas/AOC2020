fd = fopen('./input.txt');

input = textscan(fopen('input.txt'), '%s');
input = cell2mat(input{1});
n_cycles = 6;
combs = [-1 -1 -1;
        -1 -1  1;
        -1 -1  0;
        -1  0 -1;
        -1  0  1;
        -1  0  0;
        -1  1 -1;
        -1  1  1;
        -1  1  0;
         1 -1 -1;
         1 -1  1;
         1 -1  0;
         1  0 -1;
         1  0  1;
         1  0  0;
         1  1 -1;
         1  1  1;
          1  1  0;
          0 -1 -1;
          0 -1  1;
          0 -1  0;
          0  1 -1;
          0  1  1;
          0  1  0;
          0  0 -1;
          0  0  1];

% input = ['.#.';'..#';'###'];
      
center = n_cycles+1+1;
dimensions = repelem({repelem('.',size(input,1)+n_cycles*2, size(input,2)+n_cycles*2)},2*n_cycles+1+2);
dimensions{n_cycles+1+1}(n_cycles+1:n_cycles+size(input,1),n_cycles+1:n_cycles+size(input,2)) = input;
% For each cycle
for i=1:6
    new_dims = dimensions;
    for z=center-i:center+i
        for x=(n_cycles+2-i:n_cycles+size(input,1)+i-1)
            for y=(n_cycles+2-i:n_cycles+size(input,2)+i-1)
                
                num_active = 0;
                n = 1;
                while num_active < 4 && n < 27
                    if dimensions{z+combs(n,1)}(y+combs(n,2),x+combs(n,3)) == '#'
                        num_active = num_active+1;
                    end
                    n = n+1;
                end
                
                
                
                if dimensions{z}(y,x) == '#' && ~(num_active == 2 || num_active == 3)
                    new_dims{z}(y,x) = '.';
                elseif dimensions{z}(y,x) == '.' && num_active == 3
                    new_dims{z}(y,x) = '#';
                end
                
            end
            
        end
    end
    dimensions = new_dims;
end
total = 0;
for i=1:numel(dimensions)
    total = total+nnz(dimensions{i} == '#');
end
