function bootCI = boot_CIexp(data,n_boots,sig)

%% Bootstraps mean waveform confidence interval (CI) 
% includes expansion of percentile CI by sqrt(n/(n-1))

%	Input:
%  data = data array (rows = trials, columns = time relative to event)
%  n_boots = # bootstraps (needs to be sufficiently large for given sig), eg. num_boots = 1000 
%  sig = alpha value (Type 1 error rate), eg. sig = 0.05 for 95% confidence level, 0.01 for 99% confidence level

%	Output:
%  bootCI = LCI+UCI vector

%  By Philip Jean-Richard-dit-Bressel, UNSW Sydney
%  Key reference: https://doi.org/10.3389/fnmol.2020.00014
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

[n_trials,window] = size(data);

% Minimum 3 subjects (otherwise get problematic CI due to inevitable crossover points in signals oscillating at baseline)
if n_trials > 2
   
   % Prep bootstrapping variables (one row for each bootstrap)
   data_boots = zeros(n_boots, window);
   bootCI = zeros(2,window);

   % Obtain bootstrap distribution
   for b = 1:n_boots
      trial_array = ceil((n_trials).*rand(1,n_trials));
      data_boots(b,:) = mean(data(trial_array,:));
   end
   
   %% Calculate bootstrap CI
   data_boots = sort(data_boots,1);

   lower_conf_index = floor(n_boots*(sig/2));
   upper_conf_index = ceil(n_boots*(1-sig/2));

   LCI = data_boots(lower_conf_index,:);
   UCI = data_boots(upper_conf_index,:);

   % Expand CI
   CI_fix = sqrt((n)/(n-1));
   CIchange = ((UCI - LCI).*CI_fix - (UCI - LCI))/2; %/2
   bootCI(1,:) = UCI+CIchange;
   bootCI(2,:) = LCI-CIchange;

else
   fprintf('Less than 3 trials - bootstrapping skipped\n');
   bootCI = NaN;
end