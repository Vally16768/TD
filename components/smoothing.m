function s_signal= smoothing(input)
rd = 3; %Polynomial order, specified as a positive integer. order must be smaller than framelen. If order = framelen – 1, the filter produces no smoothing.
fl = 1249; % Frame length, specified as a positive odd integer.
s_signal = sgolayfilt(input,rd,fl);
