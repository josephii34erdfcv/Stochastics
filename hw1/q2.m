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
% Each troll killed independently, troll must have health of at least 3
% otherwise any fireball will kill. Fireball must do less than 3 damage 
% otherwise it will kill any troll. 
%%
% Expected troll starting health $.5*3 + .5*4 = 3.5$
%% 
% Expected fireball damage $1/3*2 + 2/3*3 = 2.666$
%% 
% Expected health remaining $= 3.5 - 2.666 = .834$

hp = randi([3,4],M,1); % make 3 or 4 health troll
hp_ave = mean(hp);
fprintf("Mean tanky troll: %f\n", hp_ave);
f = sum(randi(2,M,2),2); % do 2d2
f(f==4) = []; % remove all instances of 4 dmg fireball
f_ave = mean(f);
fprintf("Mean non-lethal fireball damage: %f\n", f_ave);
fprintf("Expected survivor health: %f\n", hp_ave - f_ave);

%% Part E 
% 50% chance of hitting with sword, 
% 50% change of hitting with hammer given sword hit 

% no I don't know why I switched from rows to columns in this file
roll_sword = randi([0,1],M,1); % generate sword hits
sword_dmg = sum(randi(6,M,2),2); % generate sword damage 
roll_hammer = randi([0,1],M,1); % generate potential hammer hits
hammer_dmg = randi(4,M,1); % generate pontential hammer damage
% conditional probability achieved by requiring sword and hammer to be true
dmg = roll_sword.*sword_dmg + roll_sword.*roll_hammer.*hammer_dmg;
fprintf("Mean Shitvam damage: %f\n", mean(dmg));

