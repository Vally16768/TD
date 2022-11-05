clear all;
close;
A=1;
factorAmplificareJitter = 500;
snr=20; 
addpath("components\");
stylesheet(A);
recorder = audioHandler();

j_signal=jitter(recorder,factorAmplificareJitter);
g_signal=gaussian(j_signal, snr);

figure,
subplot(3,1,1), plot(recorder), title ('Recorded signal');
subplot(3,1,2), plot(j_signal), title ('Jitter signal');
subplot(3,1,3), plot(g_signal), title ('Gaussian signal');
%https://www.mathworks.com/help/matlab/import_export/record-and-play-audio.html