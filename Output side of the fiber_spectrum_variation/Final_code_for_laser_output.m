%clear all;
%load('scg_50events_1000m.mat'); % Load all necessary variables from the file

% Calculate the constant curve
ef_constant = aw(200, :, 1);
fe_constant = permute(ef_constant, [3, 2, 1]);
PSD_ensemble_average_fe_constant = t_res^2 / t_max * mean(abs(fe_constant).^2, 1);
PSD_ensemble_average_wavelengthDomain_fe_constant = c ./ wavelengths.^2 .* PSD_ensemble_average_fe_constant;
averagePowerCheck_wavelengthDomain_fe = trapz(-wavelengths, PSD_ensemble_average_wavelengthDomain_fe_constant);
np_constant = PSD_ensemble_average_wavelengthDomain_fe_constant ./ averagePowerCheck_wavelengthDomain_fe;

% Set up the figure
figure('Position', [100, 100, 700, 526]); % Ensure the figure size is correct

% Set up the video file
videoFile = 'D:\IISC_Internship\Prof, Balaswami velpula\Yb LASER files\MATLAB_Codes\Animations\PSD_vs_Wavelength993.mp4';
v = VideoWriter(videoFile, 'MPEG-4');
v.FrameRate = 50 / 60; % 50 frames over 60 seconds
open(v);

% Set axis limits once outside the loop
xlim([900 1700]);
ylim([-80 20]);

% Iterate over the specified range
for i = 1:50
    % Update ef for each iteration
    ef = aw(200, :, i);
    
    % Perform calculations
    fe = permute(ef, [3, 2, 1]);
    PSD_ensemble_average_fe = t_res^2 / t_max * mean(abs(fe).^2, 1);
    PSD_ensemble_average_wavelengthDomain_fe = c ./ wavelengths.^2 .* PSD_ensemble_average_fe;
    np = PSD_ensemble_average_wavelengthDomain_fe ./ averagePowerCheck_wavelengthDomain_fe;

    % Plot the results
    plot(wavelengths * 1E9, 10 * log10(np / 1E9), 'Color', 'red', 'LineWidth', 0.5); % Dynamic curve with fixed color
    hold on;
    plot(wavelengths * 1E9, 10 * log10(np_constant / 1E9), 'Color', 'yellow', 'LineWidth', 0.5); % Constant curve
    hold off;
    xlabel('Wavelength (nm)');
    ylabel('Power spectral density (PSD)');
    title(sprintf('Iteration %d', i));
    legend('Dynamic Curve', 'Constant Curve');

    % Ensure axis limits remain consistent
    xlim([900 1700]);
    ylim([-80 20]);

    % Capture the frame
    frame = getframe(gcf);
    % Resize the frame to 700x526 to match the required dimensions
    frame.cdata = imresize(frame.cdata, [526, 700]);
    writeVideo(v, frame);
    
    % Pause to create an animation effect
    pause(1.2); % Adjusted pause duration for 60-second total animation time
end

% Close the video writer
close(v);

% Close the figure
close(gcf);
