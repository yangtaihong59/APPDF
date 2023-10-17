function [source,goal,map] = mapResize(mapOriginal,resolutionX,resolutionY,source,goal)
%UNTITLED2 此处提供此函数的摘要
%   此处提供详细说明
mapResized=imresize(mapOriginal,[resolutionX resolutionY]);
map=mapResized; % grow boundary by a unit pixel
for i=1:size(mapResized,1)
    for j=1:size(mapResized,2)
        if mapResized(i,j)==0
            if i-1>=1, map(i-1,j)=0; end
            if j-1>=1, map(i,j-1)=0; end
            if i+1<=size(map,1), map(i+1,j)=0; end
            if j+1<=size(map,2), map(i,j+1)=0; end
            if i-1>=1 && j-1>=1, map(i-1,j-1)=0; end
            if i-1>=1 && j+1<=size(map,2), map(i-1,j+1)=0; end
            if i+1<=size(map,1) && j-1>=1, map(i+1,j-1)=0; end
            if i+1<=size(map,1) && j+1<=size(map,2), map(i+1,j+1)=0; end
        end
    end
end
source=double(int32((source.*[resolutionX resolutionY])./size(mapOriginal)));
goal=double(int32((goal.*[resolutionX resolutionY])./size(mapOriginal)));

end