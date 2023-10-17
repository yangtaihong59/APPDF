clc;clear;close all
I=imread('./map/map2.bmp');
mapOriginal=im2bw(I); % input map read from a bmp file. for new maps write the file name here
%% parameters end here %%
[m,n]=size(mapOriginal);
resolutionX=m;
resolutionY=n;
source=[20 20]; % source position in Y, X format
goal=[480 480]; % goal position in Y, X format

xie_flag=~true; % true: df voronoi c False: df voronoi b
maxs=140;
dis_flag=1; % 1: 欧式距离场 0: 棋盘距离场
%%
[all_themes, all_colors] = GetColors();
pathcolor=all_themes{58}(3,:);

prunepathcolor=all_themes{62}(3,:);
%% mapResize
[source,goal,map] = mapResize(mapOriginal,resolutionX,resolutionY,source,goal);
map(1,:)=0;map(end,:)=0;
map(:,1)=0;map(:,end)=0;

%% DFcreat
% % figure()
tic
[Dint] = DFcreat(map,maxs,dis_flag,1);
[m,n]=size(Dint);
% [Dint] = DFcover(goal(1),goal(2),m,n,maxs,Dint,dis_flag);
toc
maxdint=max(max(Dint))
% Dint=Dint-1;
%%
tic
[m,n]=size(Dint);
mask = zeros(m,n);

for i=1:m
    for j=1:n-3
        Dcompare1=Dint(i,j)-Dint(i,j+1);
        Dcompare2=Dint(i,j+2)-Dint(i,j+3);
        if (Dcompare1~=0 && Dcompare2~=0)
            if Dcompare1*Dcompare2==0 || Dcompare1*Dcompare2<0
                if Dint(i,j+1)~=1
                    mask(i,j+1)=1;
                end
            end
        end
    end
end
if xie_flag
    for i=1:m-2
        for j=1:n-2
            Dcompare1=Dint(i,j)-Dint(i+1,j+1);
            Dcompare2=Dint(i+1,j+1)-Dint(i+2,j+2);
            if (Dcompare1~=0 && Dcompare2~=0)
                if Dcompare1*Dcompare2==0 || Dcompare1*Dcompare2<0
                    mask(i+1,j+1)=1;
                end
            end
        end
    end
end
Dint=rot90(Dint);
mask=rot90(mask);
[m,n]=size(Dint);
for i=1:m
    for j=1:n-3
        Dcompare1=Dint(i,j)-Dint(i,j+1);
        Dcompare2=Dint(i,j+2)-Dint(i,j+3);
        if (Dcompare1~=0 && Dcompare2~=0)
            if Dcompare1*Dcompare2==0 || Dcompare1*Dcompare2<0
                if Dint(i,j+1)~=1
                    mask(i,j+1)=1;
                end
            end
        end
    end
end
if xie_flag
    for i=1:m-2
        for j=1:n-2
            Dcompare1=Dint(i,j)-Dint(i+1,j+1);
            Dcompare2=Dint(i+1,j+1)-Dint(i+2,j+2);
            if (Dcompare1~=0 && Dcompare2~=0)
                if Dcompare1*Dcompare2==0 || Dcompare1*Dcompare2<0
                    mask(i+1,j+1)=1;
                end
            end
        end
    end
end
Dint=rot90(Dint);
mask=rot90(mask);

Dint=rot90(Dint);
mask=rot90(mask);

Dint=rot90(Dint);
mask=rot90(mask);


toc
figure();set(gcf, 'unit', 'centimeters', 'position', [0 5 20 20]);
colormap(gray(max(max(Dint))));
image(Dint)
figure();set(gcf, 'unit', 'centimeters', 'position', [20 5 20 20]);
colormap(bone(400));
image((mask==1&map==1).*-150 + (map==1).*400 +(map==0).*0);
axis equal;axis off;
% image((mask==1&map==1).*-150 + (map==1|map==0).*400 );
