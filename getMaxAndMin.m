function [maxd,maxp,mind,minp] = getMaxAndMin(points,rownum)
    %给定点和行号求当前行的最大值和最小值
	[maxd,maxp]=max(points(:,rownum));
	[mind,minp] = min(points(:,rownum));
end