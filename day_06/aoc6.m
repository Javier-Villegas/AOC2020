tic
res1 = sum(cellfun(@(x) numel(unique(x)), split(regexprep(regexprep(fileread('bigboy.txt'), '[\n\r]{3}', '$'), '[\n\r]', ''), '$'))) %#ok
toc
tic
aux = cellfun(@(x) split(x, ' '),split(regexprep(regexprep(fileread('bigboy.txt'), '[\n\r]{3}', '$'), '[\n\r]', ' '), '$'), 'UniformOutput', false);
res2 = zeros(1,length(aux));
for i=1:length(aux)
    inter = aux{i}{1};
    for k=2:length(aux{i})
        inter = intersect(inter, aux{i}{k});
    end
    res2(i) = numel(inter);
end
res2 = sum(res2) %#ok
toc