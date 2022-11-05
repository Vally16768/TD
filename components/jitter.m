function j_signal = jitter(recorder, factor, uniformOrGaussianFlag, smallOrRangeFlag, realOrImaginaryFlag)

if nargin < 1
    error('jitter:notEnoughInputs', 'This function requires at least one input.');
end
    
% Set defaults where required
if nargin < 2 || isempty(factor)
    factor = 1;
end
if nargin < 3 || isempty(uniformOrGaussianFlag)
    uniformOrGaussianFlag = 0;
end
if nargin < 4 || isempty(smallOrRangeFlag)
    smallOrRangeFlag = 0;
end
if nargin < 5 || isempty(realOrImaginaryFlag)
    realOrImaginaryFlag = ~isreal(recorder);
end
% Find the range of X, ignoring infinite value and NaNs
xFinite = recorder(isfinite(recorder(:)));
xRange = max(xFinite) - min(xFinite);
if ~smallOrRangeFlag
    % Remove 'fuzz'
    dp = 3 - floor(log10(xRange));
    xFuzzRemoved = round(recorder * 10^dp) * 10^-dp;
    % Find smallest distance between values of X
    xUnique = unique(sort(xFuzzRemoved));
    xDifferences = diff(xUnique);
    if length(xDifferences)
        smallestDistance = min(xDifferences);
    elseif xUnique ~= 0 
        % In this case, all values are the same, so xUnique has length 1
        smallestDistance = 0.1 * xUnique;
    else
        % In this case, all values are 0
        smallestDistance = 0.1 * xRange;
    end
    scaleFactor = 0.2 * factor * smallestDistance;
else
    % Calc scale factor based upon range
    scaleFactor = 0.02 * factor * xRange;
end
% Add the noise
s = size(recorder);
if uniformOrGaussianFlag
    % Normal noise
    if realOrImaginaryFlag
        randomPhaseAngles = 2 * pi * rand(s);
        j_signal = recorder + scaleFactor * randn(s) * exp(randomPhaseAngles * i);
    else
        j_signal = recorder + scaleFactor * randn(s);
    end
else
    % Uniform noise
    if realOrImaginaryFlag
        randomPhaseAngles = 2 * pi * rand(s);
        j_signal = recorder + scaleFactor * (2*rand(s)-1) * exp(randomPhaseAngles * i);
    else
        j_signal = recorder + scaleFactor * (2*rand(s)-1);
    end
end