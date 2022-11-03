function kfit_norm_loo = kfitnorm_self(data)
%Modified by PhilJRDB from kernel_CC (Colin Clifford)
% data = peri-event signal array (trials = rows, timepoints = columns)

% calculate kernels and fits on leave-one-out basis
num_trials = size(data,1);

if num_trials > 1
   t_index = 1:num_trials;
   kfit_norm_loo = zeros(num_trials,1);

	for t = 1:num_trials
      not_t = t_index(t_index~=t);
      tmp_mean = mean(data(not_t,:),1);
      kfit_norm_loo(t) = data(t,:)*(tmp_mean./sqrt(sum(tmp_mean.^2)))'./sqrt(sum(data(t,:).^2));
   end
else
   fprintf('Only 1 trial - leave-one-out kernel not calculated\n');
   kfit_norm_loo = NaN;
end
