function [kdata, kcoeff] = row_kern(data)
% Phil JRDB, normalizes each row relative to 0 (baseline)

   kcoeff = sqrt(mean(data.^2,2));
   kdata = data./kcoeff;