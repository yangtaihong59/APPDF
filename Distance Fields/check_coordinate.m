%% 检验坐标是否合法
%1.是否在区域内
%2.是否在障碍物内或者边界处

function re = check_coordinate(mx,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier)
    %1.是否在区域内
    if Ex_min>=mx || mx>=Ex_max || Ey_min>=my || my>=Ey_max
        re = 0;
        return;
    end
    %2.是否在障碍物内或者边界处(坐标+1的原因是C矩阵从(1,1)开始)
    if C(mx,my) == 80 || C(mx,my) == 100
        re = 0;
        return;
    end
    %3.%是否在already_frontiner列表中，在的话忽略
    if ismember([mx,my],cell2mat(already_frontier(:,2:3)),'rows')
    %if isempty(find(already_frontier(3,already_frontier(2,:)==mx)==my,1))==0
        re = 0;
        return;
    end
    %只有以上条件都不满足时，执行到这一句，说明该坐标合法
    re = 1;
end