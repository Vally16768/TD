function main()
clear all;
close;
microphone=0;
isPause=false;
amplitude=1;
periods=10;
isJitter=0;
isGaussian=0;
isEcho=0;
isAwg=0;

addpath("components\");
stylesheet(microphone,isPause,amplitude,periods,isJitter,isGaussian,isEcho,isAwg);
end