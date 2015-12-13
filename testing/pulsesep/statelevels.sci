function [levels, histogram, bins] = statelevels (x, nbins, method, bounds) // defing function
    
    // This function estimate statelevels of real vector X via histogram.
    // Calling Sequence
    // levels=statelevels(x, nbins, method, bounds)
    // [levels histogram]=statelevels(x, nbins, method, bounds)
    // [levels histogram bins]=statelevels(x, nbins, method, bounds)    
    // Parameters
    // x: real vector
    // nbins: number of histogram bins to use in the histogram as a positive scalar, where the default value is 100
    // method: method to estimate the statelevels using specified METHOD as one of 'mean' or 'mode', where the  default value is 'mode'
    // bounds: specify the lower and upper bound for the histogram as a two-element row vector
    // levels: return lower and upper level values
    // histogram: return histogram values
    // bins: return binlevels values
    // Examples
    // x=[1.2, 5, 10, -20, 12]
    // nbins=10
    // method='mode'
    // bounds=[1 10]
    // levels=statelevels(x, nbins, method, bounds) 
    // See also
    // Authors
    // Jitendra Singh
   

if length(x) < 2 then // checking the length of input datasat
  error('X must be a vector with more than one element.'); // if length of X is less 2, it will give error
end


if argn(2) == 1 then // checking the no of input variables
    nbins=100;   // defining the default value of no of bins
    method='mode'; // defing the defualt method 'mode'
    bounds=[min(x) max(x)];
    
end

 if type(nbins)==10 then  // checking, if nbins if numeric aur charactr
    error ('Expected NBINS to be one of these types: double, Instead its type was char.');
    end  

if pmodulo(nbins,1)==0 then // checking, if nbins is integert or not
else
    error ('Size inputs must be integers.')
end


if length(nbins)~=1 then
    error('Expected NBINS to be a scalar.')
end


  
if argn(2) == 2 then
    method='mode';
    bounds=[min(x) max(x)];
end

      if method == 'mode' | method == 'mean' then  // method should be either mean or mode
        else 
     error('Expected METHOD to match one of these strings: mean or mode');
           end
           
           
 if argn(2)==3 then  
     bounds=[min(x) max(x)];        

 end
 
 
 if type(bounds)==10 then  // checking, if nbins if numeric aur charactr
    error ('Expected BOUNDS to be one of these types: double, Instead its type was char.');
end 

if length(bounds)~=2 then
    s=size(bounds);
    error(strcat(["Expected BOUNDS to be of size 1x2 when it is actually size", " ", string(s(1)), "x", string(s(2))]))
end


if bounds(2)>0 | bounds (1)>0 then

if bounds(2)>bounds(1) then
     lower=bounds(1)
 upper=bounds(2);
    else
    error('BOUNDS must be strictly increasing.')
end
end

if  bounds(2)==0 & bounds (1)==0 then
     lower=0;
 upper=0;
end
 

 
// disp(bounds) 

  
  
  denomm = upper-lower;
  if denomm==0 then
    denomm = 2.220D-16 ;
  end
  
  idx = nbins * (x-lower)/denomm;  
  idx = ceil(idx) + (idx==0);
  idx = idx(idx>=1 & idx<=nbins);
  histo = zeros(nbins, 1);
  for i=1:length(idx)
    histo(idx(i)) = histo(idx(i)) + 1; // calculationf histogram
  end
  

  

dy = (upper - lower) / length(histo);
index=find(histo>0);

if isempty(index) then
   iLowerRegion=[] 
    iUpperRegion=[]

else
  nn=length(index);
  iLowerRegion = index(1);
 
  iUpperRegion = index(nn);
end

  if isempty(iLowerRegion) | isempty(iUpperRegion) then
    levels = ['NaN' 'NaN'];
  else
   
        
    iLow  = iLowerRegion(1);
    iHigh = iUpperRegion(1);

    // define the lower and upper histogram regions halfway
    //between the lowest and highest nonzero bins.    
    lLow  = iLow;
    lHigh = iLow + floor((iHigh - iLow)/2);
    uLow  = iLow + floor((iHigh - iLow)/2);
    uHigh = iHigh;

    lHist = histo(lLow:lHigh); // defing lower and upper histogram
    uHist = histo(uLow:uHigh);
       
      levels = zeros(1,2);
       if (method == 'mode') then // if method is mode, calculate upper and lower levels
     [j iMax] = max(lHist);
      [k iMin] = max(uHist);
      levels(1) = lower + dy * (lLow + iMax(1) - 1.5);
      levels(2) = lower + dy * (uLow + iMin(1) - 1.5);
       elseif (method=='mean') then  // if method is mean, calculate lower and upper levels
           levels(1) = lower + dy * sum(((lLow:lHigh)-0.5).* (lHist)') / sum(lHist);
      levels(2) = lower + dy * sum(((uLow:uHigh)-0.5).* (uHist)') / sum(uHist);
       end
      
      // calculation bins
      
  end

 histogram=histo;  
      bins = lower + ((1:nbins) - 0.5)' * (upper - lower) / nbins; 

  if argn(1) == 1 then // if the defined output is only 1, the it will provide the graphical representation of                          //levels
      
      if levels(1)=='NaN' | levels(2)=='NaN' then
          subplot(2,1,1)  
          plot(x, '-k', 'LineWidth',2)
             xlabel("Samples", "fontsize",3, "color", "black" )
      ylabel("Level (Volts)", "fontsize",3, "color", "black" )
      title("Signal",  "fontsize",3)
      
       subplot(2,1,2)
       plot(bins,histogram, '-k', 'LineWidth',2)
       xlabel("Level (Volts)", "fontsize",3, "color", "black" )
      ylabel("Count", "fontsize",3, "color", "black" )
           title("Histogram of the signal levels", "fontsize",3)
           
         else 
      subplot(2,1,1)
      plot(x, '-k', 'LineWidth',2)
      plot([1 length(x)],levels(1) * [1 1],'-.r', 'LineWidth',2)
      plot([1 length(x)],levels(2) * [1 1],'-.r', 'LineWidth',2)
      xlabel("Samples", "fontsize",3, "color", "black" )
      ylabel("Level (Volts)", "fontsize",3, "color", "black" )
      title("Signal",  "fontsize",3)
      
      subplot(2,1,2)
      plot(bins,histogram, '-k', 'LineWidth',2)
       xlabel("Level (Volts)", "fontsize",3, "color", "black" )
      ylabel("Count", "fontsize",3, "color", "black" )
      
      title("Histogram of the signal levels", "fontsize",3)
      end
      end
      
      
  endfunction
  
