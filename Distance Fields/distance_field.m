close all;clc;clear;
pause(0.5)
savepath='./pic/Result/env/';

env=5;
mappath=strcat('./mapall/map',num2str(env),'.bmp');
I=imread(mappath);
mapOriginal=im2bw(I); % input map read from a bmp file. for new maps write the file name here
%%
resolutionX=500;
resolutionY=500;
source=[10 10]; % source position in Y, X format
goal=[470 470]; % goal position in Y, X format

maxFailedAttempts = 1000;

display=true; % display the results of RRT and df RRT (Significantly affect the calculation time)

if display,repeatnum=1;else, repeatnum=100;end % repeat test

dis_flag=0;
flag_cover=1;
flag_prune=0; % path prune with distance field 1:no pre-pruning 0:maybe pre-pruning
round_st_flag=~true; % rand source & goal
pdfsave_flag=~true;
% birrt
stepsize=10; % size of each step of the RRT
disTh=10; % nodes closer than this threshold are taken as almost the same
% df birrt
min_stepsize=10;% size of min step of the DFRRT
maxs=125;
%%%%% parameters end here %%%%%
%%
[all_themes, all_colors] = GetColors();
pathcolor=all_themes{58}(3,:);
pathcolor2=all_themes{63}(3,:);
edgecolor1=all_themes{63}(2,:);
edgecolor2=all_themes{63}(4,:);
prunepathcolor=all_themes{62}(3,:);
savemodepathcolor=all_themes{61}(3,:);
%% mapResize
[source,goal,map] = mapResize(mapOriginal,resolutionX,resolutionY,source,goal);
map(1,:)=0;map(end,:)=0;
map(:,1)=0;map(:,end)=0;
%% distance field creat
tdf = 50
raice_map = map*tdf;
[m, n] = size(raice_map);
dir_list = [ 1, 1;
             1, 0;
             1,-1;
             0, 1;
             0,-1;
            -1, 1;
            -1, 0;
            -1,-1 ];
%%
tic
for df = 1:tdf
    [row, col] = find(raice_map == df-1);
    if length(row) == 0
        disp("distance field finish")
        break
    end
    for l = 1: length(row)
        i = row(l);
        j = col(l);
        dir = ones(8,2).*[i,j] + dir_list;
        for k = 1:8
            if ((dir(k,1)>0 & dir(k,1)<m) & (dir(k,2)>0 & dir(k,2)<n)) & raice_map(dir(k,1),dir(k,2)) == tdf
                raice_map(dir(k,1),dir(k,2)) = df ;
            end
        end
    end
end
toc

%% draw SDF
Dint=raice_map;
if display
    gcf=figure();set(gcf, 'unit', 'centimeters', 'position', [10 5 20 20]);
    colormap(gray(max(max(Dint))));
    image(Dint)
    line(source(2),source(1),'Color','b','LineWidth',2,'Marker','o');
    line(goal(2),goal(1),'Color','r','LineWidth',2,'Marker','o');
    axis equal
    axis off
end
