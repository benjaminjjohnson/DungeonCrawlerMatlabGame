%% Random color generator (to use for tiles)
% Author: Olivia Wang
clear
clc


%% Make a 1 x 3 array of zeros
a = zeros([1,3]);

for i = 1:3
    a(i) = rand(1);      % Random number from 0 to 1 
end

figure('Color',[a(1) a(2) a(3)]);
