function kfit_norm1on2 = kfitnorm_compare(data1,data2)
%Modified by PhilJRDB from kernel_CC (Colin Clifford)
%Determines fit of dataset1 on data2 kernel
% data = peri-event signal array (trials = rows, timepoints = columns)

% calculate kernels and fits on leave-one-out basis
mean_resp = mean(data2,1);
kdata = mean_resp./sqrt(sum(mean_resp.^2));
num_trials = size(data1,1);
kfit_norm1on2 = zeros(num_trials,1);

for t = 1:num_trials
   kfit_norm1on2(t) = data1(t,:)*kdata'./sqrt(sum(data1(t,:).^2));
end

