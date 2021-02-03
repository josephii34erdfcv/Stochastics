%% EpicQUESTion 2
M = 10;
M = 1e6; % number of experiments to perform 
%% Part A
% Average troll health $= .25*1 + .25*2 + .25*3 +.25*4 = 2.5$
hp = randi(4,M,1); % set of 1d4
hp_ave = mean(hp); % average troll health
fprintf("Average troll health: %f\n", hp_ave);

%%
% Average fireball damage $= 0*1 + .25*2 + .50*3 + .25*4 = 3$
f = randi(2,M,2); % set of 2d2
f_dmg = sum(f,2); % compute damage 
f_ave = mean(f_dmg); % average fireball damage
f_3 = sum(f_dmg>3)/M; % probability damage > 3
fprintf("Average fireball damage: %f\n", f_ave);
fprintf("Probability fireball >3: %f\n", f_3);

%% Part B
% I don't know how to do this nice 
% How to do nice latex in here?

%% Part C

hp = randi(4,M,2); % make M banks of 2 trolls
f = randi(2,M,2); % throw 2 die for each spell
f_dmg = sum(f,2); % compute fireball damage
hp_new = hp - f_dmg; % attack troll
kia = hp_new <= 0; % see if dead
dead = sum(kia,2); % count the dead
fprintf("Probability of 2 kill: %f\n", sum(dead == 2)/M);

%% Part C Theoretical
theoretical_dead = 0;
prob_space = [1,2,3,4];
%for loop for each troll, iterating through combinations
%using conditional probability aptly for each case
%e.g. set of troll hp of [1,1] is killed, at the very least when fireball
%>=1, such that p(fireball>=1|[1,1]) = 1*(1/4)^2
for i = prob_space
    for j = prob_space
        if i ==4 || j ==4
            theoretical_dead = theoretical_dead+(1/4)^3;
        elseif i == 3 || j==3
            theoretical_dead = theoretical_dead + (3/4)*(1/4)^2;
        elseif i==2 || j ==2
            theoretical_dead = theoretical_dead + (1/4)^2;
        else
            theoretical_dead = theoretical_dead + (1/4)^2;
        end
    end
end

fprintf("Theoretical probability of 2 kill: %f\n", theoretical_dead);
%% Part D

% Each troll killed independently, troll must have health of at least 3
% otherwise any fireball will kill. Fireball must do less than 3 damage 
% otherwise it will kill any troll. 


kia(dead~=1,:)=1; % find lone survivors 
survivor_hp = hp_new(~kia); % check their health 
fprintf("Mean survivor health: %f\n", mean(survivor_hp));

%% Part D Theoretical
%case 1: fireball >= 3 and hp is 4
%case 2: fireball >=2 and hp is 3
%case 3: fireball >= 2 and hp is 4
expected_remaining_hp = (3-2)*(1/3)+(4-2)*(1/3)+(4-3)*(1/3); %(troll starting health - fireball damage)*prob
fprintf("Theoretical mean survivor health: %f\n",expected_remaining_hp);

%% Part E 
% 50% chance of hitting with sword, 
% 50% change of hitting with hammer given sword hit 
% I didn't compute the damage probabilities 

roll_sword = randi([0,1],M,1); % generate sword hits
sword_dmg = sum(randi(6,M,2),2); % generate sword damage 
roll_hammer = randi([0,1],M,1); % generate potential hammer hits
hammer_dmg = randi(4,M,1); % generate pontential hammer damage
% conditional probability achieved by requiring sword and hammer to be true
dmg = roll_sword.*sword_dmg + roll_sword.*roll_hammer.*hammer_dmg;
fprintf("Mean Shitvam damage: %f\n", mean(dmg));

