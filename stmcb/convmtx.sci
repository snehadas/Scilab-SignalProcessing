function b = convmtx (a, n)

  [r, c] = size(a);

  if ((r ~= 1) & (c ~= 1)) | (r*c == 0)
    error("convmtx: expecting vector argument");
  end

  b = toeplitz([a(:); zeros(n-1,1)],[a(1); zeros(n-1,1)]);
  if (c > r)
    b = b.';
  end

endfunction
