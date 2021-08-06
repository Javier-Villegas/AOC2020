function val = addBags(bags, entry)
	val = 0;
	for i=1:length(entry)
        if strcmp(entry{i}, 'no other bags.')
            continue; 
        else
            ind = strfind(entry{i}, ' ');
            aux = addBags(bags, bags(entry{i}(ind(1)+1:ind(3)-1)));
            aux = str2double(entry{i}(1:ind(1)-1))*aux;
            val = val + str2double(entry{i}(1:ind(1)-1))+aux; 
            %val = val + aux;
            
        end
	end
end