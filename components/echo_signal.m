function e_signal = echo_signal(in,fs,delay,gain)
%in-input audio
%fs-the sampling rate. For example, an audio CD uses 44,100 samples per second.
%delay- the delay of the echo in seconds. That is, the echo should start after delay seconds have passed from the start of the audio signal.
%gain - specifies the amplification of the echo which normally should be a value less than 1, since the echo is typically not as loud as the original signal. 
samples = round(fs*delay) ;
ds = floor(samples);
signal = zeros(length(in)+ds,1);
signal(1:length(in))=in;
echo_signal =zeros(length(in)+ds,1);
echo_signal(ds+(1:length(in*gain)))=in*gain;
e_signal= signal + echo_signal;
p= max(abs(e_signal));
if p>1
e_signal=e_signal ./ p;
else
e_signal = e_signal;
end
end