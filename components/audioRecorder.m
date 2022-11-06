function recorder = audioHandler()
info = audiodevinfo;
recorder = audiorecorder(44100,16,1,0); 
record(recorder);
pause(5);
stop(recorder);
recorder = getaudiodata(recorder);%retinem doar esantioanele
end