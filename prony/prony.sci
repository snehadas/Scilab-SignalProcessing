function [b,a] = prony(h, nb ,na)
    
    M = nb;
    N = na;
    
    k = length(h) - 1;
    
    if k<= max(M, N) then
        k = max(M, N) + 1;
        h(k+1) = 0; 
    end
    
    c = h(1)
    if c == 0  then
        c = 1;
    end
    
    H = toeplitz(h/c,[1 zeros(1,k)]);
    
    if (k > N) then
        H(:,(N+2):(k+1)) = [];
    end

    H1 = H(1:(M+1),:);	
    h1 = H((M+2):(k+1),1);	
    H2 = H((M+2):(k+1),2:(N+1));	
    a = [1; -H2\h1].';
    b = c*a*H1.';
       
    
endfunction
