%% ���������Ƿ�Ϸ�
%1.�Ƿ���������
%2.�Ƿ����ϰ����ڻ��߽߱紦

function re = check_coordinate(mx,my,Ex_min,Ex_max,Ey_min,Ey_max,C,already_frontier)
    %1.�Ƿ���������
    if Ex_min>=mx || mx>=Ex_max || Ey_min>=my || my>=Ey_max
        re = 0;
        return;
    end
    %2.�Ƿ����ϰ����ڻ��߽߱紦(����+1��ԭ����C�����(1,1)��ʼ)
    if C(mx,my) == 80 || C(mx,my) == 100
        re = 0;
        return;
    end
    %3.%�Ƿ���already_frontiner�б��У��ڵĻ�����
    if ismember([mx,my],cell2mat(already_frontier(:,2:3)),'rows')
    %if isempty(find(already_frontier(3,already_frontier(2,:)==mx)==my,1))==0
        re = 0;
        return;
    end
    %ֻ������������������ʱ��ִ�е���һ�䣬˵��������Ϸ�
    re = 1;
end