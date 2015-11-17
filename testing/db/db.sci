function [dboutput]  = db(X, SignalType, R)
funcprot(0);

[nr, nc] = size(X);
dboutput = zeros(nr,nc);

if (~exists('SignalType', 'local')) then     	//-- quotes around the parameter name are required
						//-- 'local' excludes global variables from search
	SignalType = 'voltage';
	
	if ~exists('R', 'local') then		//Default SignalType is voltage and R is 1 ohm
		R = 1;
	end
	
	for i = 1:nr
		for j = 1:nc
			dboutput(i,j) = 10 * log10((abs(X(i,j))*abs(X(i,j)))/R);
		end
	end

else
    
    if(~exists('R','local')) then
    		R = 1;
    end
    
    if(SignalType=='voltage' | SignalType=='Voltage' | SignalType=='VOLTAGE') then
	    	for i = 1:nr
			for j = 1:nc
				dboutput(i,j) = 10 * log10((abs(X(i,j))*abs(X(i,j)))/R);
			end
		end
    
    elseif(SignalType=='power' | SignalType=='Power' | SignalType=='POWER') then
    
    		for i = 1:nr
			for j = 1:nc
				dboutput(i,j) = 10 * log10(X(i,j));
			end
		end
    end
    
end

endfunction
