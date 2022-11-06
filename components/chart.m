function chart(fig,amplitude,isJitter,isGaussian,isEcho,isAwg)
factorAmplificareJitter = 500;
gaussianSnr=20; 

originalSignal = audioHandler();
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

% if(isEcho)
% end
% 
% if(isAwg)
% end

originalChartUI = uiaxes(fig, 'Position',[650 500 550 400]);
 plot(originalChartUI,originalSignal);

editedChartUI = uiaxes(fig, 'Position',[650 100 550 400]);
 plot(editedChartUI,editedSignal);

end