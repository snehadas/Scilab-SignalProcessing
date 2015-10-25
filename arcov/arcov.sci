function [ar_coeff, var_est] = arcov(data_in, order)
    
    checkNArgin(2,2, argn(2));
    method = 'covariance';
    [ar_coeff, var_est, msg] = arParEst(data_in, order, method);
    if ~isempty(msg) then
        error(msg);
    end
    
    
endfunction

function checkNArgin(min_argin, max_argin, num_of_argin)
    if num_of_argin < min_argin then
        error('Not enough input arguments')
    end
    
    if num_of_argin > max_argin then
        error('Too many input arguments')
    end
        
endfunction
