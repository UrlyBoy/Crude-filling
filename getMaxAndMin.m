function [maxd,maxp,mind,minp] = getMaxAndMin(points,rownum)
    %��������к���ǰ�е����ֵ����Сֵ
	[maxd,maxp]=max(points(:,rownum));
	[mind,minp] = min(points(:,rownum));
end