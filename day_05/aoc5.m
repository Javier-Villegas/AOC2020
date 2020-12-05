tic
% fid = fopen('input.txt');
fid = fopen('ihs2.txt');
pass = textscan(fid,'%s');
pass = cell2mat(pass{1});

pass((pass == 'B')|(pass == 'R')) = '1';
pass((pass == 'F')|(pass == 'L')) = '0';
% ID = sort(bin2dec(pass(:,1:end-3))*8 + bin2dec(pass(:,end-2:end)));
ID = sort(bin2dec(pass(:,1:end-5))*32 + bin2dec(pass(:,end-4:end)));
% Part 1
res1 = max(ID);
fprintf('Max ID: %d\n',res1)
% Part 2
res2 = ID(ID(2:end) ~= (ID(1:end-1)+1))+1;
fprintf('Missing seat: %d\n',res2)
toc