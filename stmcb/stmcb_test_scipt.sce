// Test script for stmcb

init_den = [0.3 0.7 1.2 1.8 0.65 2.7 0.9 3];
input = [1 zeros(1,100)];
    [b,a] = stmcb( h, input, 8, 8, 10 )
