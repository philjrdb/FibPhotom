function waveformCI = boot_waveformCI(data,num_boots,sig)

%% Bootstrapped Confidence Interval (percentile CI) for mean waveform

%%Inputs:
% data = data array (rows = trials, columns = time relative to event)
% num_boots = # bootstraps (e.g. = 1000)
% sig = alpha (Type I error rate), eg. = 5 for 95% confidence level

%%Output:
% waveformCI = [LCI;UCI] array

%  Copyright 2020 Philip Jean-Richard-dit-Bressel, UNSW Sydney
%  Based on Colin Clifford 2018 bootstrap_CI.m 

% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.

%%
[num_trials,window] = size(data);

% Demands minimum 2 trials (otherwise get funky signals due to inevitable crossing oscillations)
if num_trials > 2

   %% Calculate bootstrap CI   
   % Prep bootstrapping variables (one row for each bootstrap) ...
   data_boots = zeros(num_boots, window);

   for b = 1:num_boots
      % bootstrap data + kernel across all trials ...
      trial_array = ceil((num_trials).*rand(1,num_trials));
      data_boots(b,:) = mean(data(trial_array,:));
   end
   
   waveformCI = prctile(data_boots,[sig/2 (1-sig/2)],1);

else
   fprintf('Less than 3 trials - bootstrapping skipped\n');
   waveformCI = NaN;
end
