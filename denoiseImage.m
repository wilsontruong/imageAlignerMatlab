function output = denoiseImage(input)
    % Parameters
    h = 0.5; % Filtering parameter
    patchSize = size(input, 1);
    
    % Compute weights and denoised value
    weights = exp(-sum((input - repmat(input(patchSize/2, patchSize/2), patchSize, patchSize)).^2) / (h^2));
    output = sum(weights(:) .* input(:)) / sum(weights(:));
end

