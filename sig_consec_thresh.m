function [sig_idx] = sig_consec_thresh(CI,threshold)

%% Tests CI against 0, applies temporal/consecutive threshold

%%Input:
% CI = array of lower/upper confidence intervals ([LCI per timepoint; UCI per timepoint])
% threshold = minimum # consecutively significant datapoints for significance flag (ie. temporal threshold), 
%             eg. threshold = 3 (sig_idx will only flag significance for 3+ consecutively significant timepoints)
%                 threshold = 0 for no temporal threshold

%%Output:
% sig_idx = logic vector for when CI does not contain 0 >=threshold (ie. true = significant, false = not significant)

%  By Philip Jean-Richard-dit-Bressel, UNSW Sydney
%  Key reference: https://doi.org/10.3389/fnmol.2020.00014

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

init_sig_idx = find((CI(1,:)>0)|(CI(2,:)<0));

sig_idx = false(size(CI,2),1);
if threshold > 0
  sig_idx(init_sig_idx(consec_idx(init_sig_idx,threshold))) = true;
else
  sig_idx(init_sig_idx) = true;
end