%% Ѱ���ھӽڵ㣨�������ҡ����ϡ����¡����ϡ����£�
% N -- �����ھ�����
% mx,my -- ��ǰ�������
% Ex_min,Ex_max -- ��ͼ��x����ķ�Χ
% Ey_min,Ey_max -- ��ͼ��y����ķ�Χ
% C -- ��ͼ���Ǿ���

function N = find_frontier(mx,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier)
    neigh = zeros(2,0);
    index = 1;
    %�����ھӵĺϷ��ԣ��Ƿ��������ڣ����Ƿ����ϰ����ڻ�߽���
    %���ھ�
    if check_coordinate(mx,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1  %����1��ʾ�Ϸ�
        neigh(1,index) = mx;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %���ھ�
    if check_coordinate(mx,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx;
        neigh(2,index) = my-1;
        index = index + 1;
    end
    %���ھ�
    if check_coordinate(mx-1,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my;
        index = index + 1;
    end
    %���ھ�
    if check_coordinate(mx+1,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my;
        index = index + 1;
    end
    
    %�����ھ�
    if check_coordinate(mx-1,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %�����ھ�
    if check_coordinate(mx+1,my+1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my+1;
        index = index + 1;
    end
    %�����ھ�
    if check_coordinate(mx-1,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx-1;
        neigh(2,index) = my-1;
        index = index + 1;
    end
    %�����ھ�
    if check_coordinate(mx+1,my-1,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier) == 1
        neigh(1,index) = mx+1;
        neigh(2,index) = my-1;
    end
    
    N = neigh;
end

