clear all;
close;
A=1;
addpath("components\");
stylesheet(A);
recorder = audioHandler();

j_signal=jitter(recorder,500);
figure, 
subplot(2,1,1),plot(recorder), title('Recorder signal');
subplot(2,1,2),plot(j_signal), title('Jitter signal');

%https://www.mathworks.com/help/matlab/import_export/record-and-play-audio.html