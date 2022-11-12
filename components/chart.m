function chart(fig,microphone,ActionText,amplitude,periods,isJitter,isGaussian,isEcho,isAwg)
factorAmplificareJitter = 500;
gaussianSnr=20; 

if(microphone)
ActionText.String='Inregistreaza';
originalSignal = audioRecorder();
editedSignal = originalSignal;
else
ActionText.String='Semnal de test';
originalSignal = sin(0:0.1:6*periods);
editedSignal = originalSignal;
end

if(amplitude&&amplitude~=1)
    editedSignal = editedSignal.*amplitude;
end

if(isJitter)
    editedSignal=jitter(editedSignal,factorAmplificareJitter);
end

if(isGaussian)
    editedSignal=gaussian(editedSignal, gaussianSnr);
end

if(isEcho)
    editedSignal=echo_signal(editedSignal,44100,0.3,0.5);
end

if(isAwg)
    editedSignal=smoothing(editedSignal);
end

originalChartUI = uiaxes(fig, 'Position',[650 500 550 400]);
 plot(originalChartUI,originalSignal);

editedChartUI = uiaxes(fig, 'Position',[650 100 550 400]);
 plot(editedChartUI,editedSignal);


if(microphone) 
    ActionText.String='Reda';
    soundsc(double(editedSignal),44100,16);
end

end