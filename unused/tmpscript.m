for i = 18:length(activeNames2(:,3))
    % 7, 12, 15, 16, 17, 19, 
    
    
    
    
    
if (activeNames2{i, 3}(1)>activeNamesF3{i, 3}(1))
error(['lower limit fail at ' num2str(i)])
elseif activeNames2{i, 3}(2)<activeNamesF3{i, 3}(2)
error(['upper limit fail at ' num2str(i)])
end
end