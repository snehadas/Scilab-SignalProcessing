function [zero, pole, gain] = tf2zpk(num, den)
    
    if argn(2)< 2 | isempty(den) then
        den = 1;
    end
    
    [num, den] = eqtflength(num, den);
    [zero, pole, gain] = tf2zp(num, den); 
    
endfunction
