%% EpicQUESTion 2
M = 10;
M = 1e6; % number of experiments to perform 
%% Part A
% Average troll health $= .25*1 + .25*2 + .25*3 +.25*4 = 2.5$
hp = randi(4,M,1); % set of 1d4
hp_ave = mean(hp); % average troll health
fprintf("Average troll health: %f", hp_ave);

%%
% Average firefball damage $= 0*1 + .25*2 + .50*3 + .25*4 = 3$
f = randi(2,M,2); % set of 2d2
f_dmg = sum(f,2); % compute damage 
f_ave = mean(f_dmg); % average fireball damage
f_3 = sum(f_dmg>3)/M; % probability damage > 3
fprintf("Average fireball damage: %f\n", f_ave);
fprintf("Probability fireball >3: %f", f_3);

%% Part B
% I don't know how to do this nice 

%% Part C
% P ~ 0.177
hp = randi(4,M,6); % make M banks of 6 trolls
f = randi(2,M,2,6); % throw 2 die for each spell
f_dmg = squeeze(sum(f,2)); % compute fireball damage
kia = (hp - f_dmg) > 0; % attack troll, see if dead
dead = sum(sum(kia,2) == 0)/M; % count the dead
fprintf("Probability of 6 kill: %f", dead);
%% Part D
% Each troll killed independently
%%
% Expected troll starting health $.5*3 + .5*4 = 3.5$
%% 
% Expected fireball damage $1/3*2 + 2/3*3 = 2.666$
%% 
% Expected health remaining $= 3.5 - 2.666 = .834$

% Don't feel like simming 
hp = randi([3,4],M,1); % make 3 or 4 health troll
% how to make die throws?
%% Part E 
% 50% chance of doing no damage



