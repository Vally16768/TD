function main()
clear all;
close;
isPause=false;
amplitude=1;
isJitter=0;
isGaussian=0;
isEcho=0;
isAwg=0;

addpath("components\");
stylesheet(isPause,amplitude,isJitter,isGaussian,isEcho,isAwg);
end