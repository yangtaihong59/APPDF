%% 寻找邻居节点（上下左右、左上、左下、右上、右下）
% N -- 返回邻居坐标
% mx,my -- 当前点的坐标
% Ex_min,Ex_max -- 地图中x坐标的范围
% Ey_min,Ey_max -- 地图中y坐标的范围
% C -- 地图覆盖矩阵

function N = find_frontier(mx,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier)
    neigh = zeros(2,0);
    index = 1;
    %检验邻居的合法性，是否在区域内，或是否在障碍物内或边界上
    %上邻居
    if check_coordinate(mx,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1  %返回1表示合法
        neigh(1,index) = mx;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %下邻居
    if check_coordinate(mx,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx;
        neigh(2,index) = my-1;
        index = index + 1;
    end
    %左邻居
    if check_coordinate(mx-1,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my;
        index = index + 1;
    end
    %右邻居
    if check_coordinate(mx+1,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my;
        index = index + 1;
    end
    
    %左上邻居
    if check_coordinate(mx-1,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %右上邻居
    if check_coordinate(mx+1,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %左下邻居
    if check_coordinate(mx-1,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my-1;
        index = index + 1;
    end
    %右下邻居
    if check_coordinate(mx+1,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my-1;
    end
    
    N = neigh;
end

