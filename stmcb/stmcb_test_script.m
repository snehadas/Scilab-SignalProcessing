  [b,a] = butter(10,0.2);              % Butterworth filter design
  h = filter(b,a,[1 zeros(1,100)]);   % Filter data using above filter
  %freqz(b,a,128)                      % Frequency response
  [bb,aa] = stmcb(h, [1 zeros(1,100)], 8, 8, 10);
  figure; freqz(bb,aa,128)