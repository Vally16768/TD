function chart(fig,ActionText,amplitude,isJitter,isGaussian,isEcho,isAwg)
factorAmplificareJitter = 500;
gaussianSnr=20; 
ActionText.String='Inregistreaza';
originalSignal = audioRecorder();
editedSignal = originalSignal;

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
ActionText.String='Reda';
 soundsc(double(editedSignal),44100,16);
end