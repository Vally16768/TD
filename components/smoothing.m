function s_signal= smoothing(input)
windowWidth=100;
s_signal = movmean(input, windowWidth); % returns an array of local k-point mean values, where each mean is calculated over a sliding window of length k across neighboring elements of the input.