function [Dint] = DFcreat(I,maxs,dis_flag,flag_cover)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明

% subplot(1,2,1),imshow(Ic);
% subplot(1,2,2),imshow(I);

% map2=ones(M,N);
% for i = 2:M-1
%     for j=2:N-1
%         if~((map(i,j)==1&map(i+1,j)==1&map(i-1,j)==1&map(i,j+1)==1&map(i,j-1)==1&map(i+1,j+1)==1&map(i+1,j-1)==1&map(i-1,j+1)==1&map(i-1,j-1)==1)|...
%                 (map(i,j)==1&map(i+1,j)==1&map(i-1,j)==1&map(i,j+1)==1&map(i,j-1)==1&map(i+1,j+1)==1&map(i+1,j-1)==1&map(i-1,j+1)==1&map(i-1,j-1)==1))
%             map2(i,j)=0;
%         end
%     end
% end

%%
if flag_cover==1
    [M,N]=size(I);
    map=im2bw(I);
    Ic=I;
    for i = 2:M-1
        for j=2:N-1
            if((I(i,j)==0&I(i+1,j)==0&I(i-1,j)==0&I(i,j+1)==0&I(i,j-1)==0&I(i+1,j+1)==0&I(i+1,j-1)==0&I(i-1,j+1)==0&I(i-1,j-1)==0))%|...
              % (I(i,j)==1&I(i+1,j)==1&I(i-1,j)==1&I(i,j+1)==1&I(i,j-1)==1&I(i+1,j+1)==1&I(i+1,j-1)==1&I(i-1,j+1)==1&I(i-1,j-1)==1))
                Ic(i,j)=1;
            end
        end
    end
    map2=im2bw(~Ic);
    % % map2=~map;
    % map2(1,:) = 1;   map2(:,1) = 1;
    % map2(end,:) = 1; map2(:,end) = 1;
    [m,n]=size(map2);
    index=find(map2);
    [i,j]=ind2sub(size(map2),index);
    Dint = maxs *ones(m,n);
    [Dint] = DFcover(i,j,m,n,maxs,Dint,dis_flag);
    % map1=im2bw(I);
    % [m,n]=size(map1);
    % [Dint] = DFcover2(map1,m,n,Dint);
    %
    % %%
    % for i=1:m
    %     for j=1:n
    %         if Dint(i,j)>11
    %             Dint(i,j)=11;
    %         end
    %     end
    % end
elseif flag_cover==2
    map1=im2bw(I);
    [m,n]=size(map1);
    Dint = maxs *ones(m,n);
    [Dint] = DFcover2(~map1,m,n,Dint);
end

end