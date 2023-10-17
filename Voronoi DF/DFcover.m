function [Dint] = DFcover(xl,yl,rows,cols,maxs,Dint,dis_flag)
%UNTITLED2 此处提供此函数的摘要
%   此处提供详细说明
cover = maxs * ones(2*maxs-1, 2*maxs-1);

if dis_flag==0
    for i=1:2*maxs-1
        for j=1:2*maxs-1
            dis = max(abs(i-(maxs)),abs(j-(maxs)));
            cover(i,j)=dis;
        end
    end
else
    for i=1:2*maxs-1
        for j=1:2*maxs-1
            dis = sqrt((i-(maxs))^2+(j-(maxs))^2);
            cover(i,j)=dis;
        end
    end
end

coverint=floor(cover);

for c = 1:length(xl)
    cover_flag = ones(2*maxs-1, 2*maxs-1);
    endx=xl(c);
    endy=yl(c);
    %%
    r1=endx-(maxs-1);
    r2=endx+(maxs-1);

    c1=endy-(maxs-1);
    c2=endy+(maxs-1);

    %%
    cr1=1;cc1=1;
    if r1<=0
        cr1=abs(r1)+2;
        r1=1;
    end
    if c1<=0
        cc1=abs(c1)+2;
        c1=1;
    end

    if r2>rows
        r2=rows;
    end
    if c2>cols
        c2=cols;
    end

    countr=0;
    for i=r1:r2
        countc = 0;
        for j=c1:c2
            cpx=cr1+countr;
            cpy=cc1+countc;
            if coverint(cpx,cpy)<Dint(i,j)
                Dint(i,j)=coverint(cr1+countr,cc1+countc);
                
            end
            countc = countc+1;
        end
        countr =countr +1;
    end

end

% % 热力图
% figure();
% h=heatmap(rot90(Dint));
end