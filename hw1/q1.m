%% EpicQUESTion 1 
%M = 5;
M = 1e6; % number of experiments to perform 
%% Part A
% $P(Y=18) = P(X=6)^3 = (1/6)^3 = 0.0046$

% 6^3 permutations
rolls = randi(6,3,M); % generate set of 3d6
net = sum(rolls,1); % sum rolls to get score
% What fraction of experiments result in 18?
sum(net==18)/M

%% Part B 
% Keene did this using binomials? 
% $P(Z=18) = P(Y)*3 = 0.0138$
rolls = randi(6,3,M,3); % generate 3 trials of 3d6
x = sum(rolls,1); % combine rolls for score 
y = sum(x==18,3); % calculate how many scores are 18
% Fraction of experiments resulting in score of 18
sum(y>0)/M

%% Part C
% $P(A) = P(Z=18)^6 = 6.9068e-12$
% Too large to represent with array 
M = 1e4;
n = 0;
for i = 0:M
    rolls = randi(6,3,3,6); % generate 6 trials of 3d6
    x = sum(rolls,1); % get 3 scores 
    y = sum(x==18,2); % check if 18
    n = n + double(sum(y>0)==6); % increment the number of Fontaines
end
% Will almost always be zero
n
% Fraction of experiments 
n/M

%% Part D
% This part is not correct 
% 9 must be the greatest value in the best of 3 case
clc
%M = 1e6;
M = 1e4;
n = 0;
for i = 0:M
    rolls = randi(6,3,3,6);
    x = sum(rolls,1);
    y = sum(x==18,2);
    n = n + double(sum(y>0)==6);
end
n
n/M

%% Part D revised
%M=1e8; %~60gb array
rolls = randi(6,3,M,3,6);
x = sum(rolls,1);
y = sum(x==18,3);
% Fraction of experiments resulting in at least one 18
sum(sum(y,4)==6)/M