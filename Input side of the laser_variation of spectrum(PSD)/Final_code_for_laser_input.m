% Check if 'aw' exists in the loaded data
if ~exist('aw', 'var')
    error('Variable "aw" is not found in the loaded MAT-file.');
end

% Set up the figure with specified dimensions for animation
figure('Position', [100, 100, 700, 526]);

% Set up the video file
videoFile = 'D:\IISC_Internship\Prof, Balaswami velpula\Yb LASER files\MATLAB_Codes\PSD_vs_Wavelength[-80 20].mp4';
v = VideoWriter(videoFile, 'MPEG-4');
v.FrameRate = 200 / 60; % Set the frame rate to ensure 60 seconds duration
open(v);

% Initialize array to store normalized PSD
psd_normalized = zeros(size(aw, 1), size(aw, 2)); % Adjusted for 2D as we'll average over the 3rd dimension
totalPower = zeros(200, 1);

% Initialize array to store average PSD for each iteration
average_psd_per_iteration = zeros(200, 1);

% Calculate average PSD for each event set (1 to 50) for iterations 1 and 2
for i = 1:2
    % Pre-calculate average PSD for this iteration
    ef_avg = mean(aw(i, :, 1:50), 3);
    for ii = 1:200
        % Use pre-calculated average PSD for efficiency
        psd_nu = t_res^2 / t_max * abs(ef_avg).^2;
        psd = c ./ wavelengths.^2 .* psd_nu;
        totalPower(ii) = trapz(-wavelengths, psd);
    end
end

% Iterate over the specified range (200 iterations)
for i = 1:200
    % Use appropriate averaging method based on iteration number
    if i <= 2
        ef = ef_avg; % Use pre-calculated average for iterations 1 and 2
    else
        ef = mean(aw(i, :, 1:50), 3); % Calculate average for other iterations
    end

    % Calculate the squared magnitude of 'aw' to get PSD
    psd_nu = t_res^2 / t_max * abs(ef).^2;
    psd = c ./ wavelengths.^2 .* psd_nu;

    % Normalize PSD for each event set
    psd_normalized = psd / totalPower(i); % Normalize by total power
    
    % Store the average PSD for this iteration
    average_psd_per_iteration(i) = mean(psd_normalized);

    % Plot the results for the current iteration
    plot(wavelengths * 1E9, 10 * log10(psd_normalized / 1E9), 'Color', 'blue', 'LineWidth', 0.8); % Changing curve with fixed color
    xlabel('Wavelength (nm)');
    ylabel('Power spectral density (PSD)');
    title(sprintf('Iteration %d', i));
    
    % Set y-axis limits
    ylim([-80 20]);
    % Set x-axis limits
    xlim([900 1700]);

    % Ensure the frame has the correct dimensions
    frame = getframe(gcf);
    % Resize the frame to the correct dimensions
    frame.cdata = imresize(frame.cdata, [350, 700]);
    writeVideo(v, frame);

    % Pause to create an animation effect
    pause(0.01); % Adjusted pause duration for 60-second total animation time
end

% Close the video writer
close(v);

% Close the figure used for animation
close(gcf);

% Plot the average PSD against iteration index
figure;
plot(1:200, 10 * log10(average_psd_per_iteration / 1E9), 'Color', 'blue', 'LineWidth', 0.8); % Adjust if necessary
xlabel('Iteration index');
ylabel('Average Power Spectral Density (PSD) [dB]');
title('Average PSD vs. Iteration Index');
grid on;
