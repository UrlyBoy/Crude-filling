function [ px1,px2,y ] = redPoint(px1,px2,y)
%�����������佫�������������Ĭ�ϼ����0.1
%  
    denisity = 0.08;
    minpix = min(px1,px2);
    maxpix = max(px1,px2);
    for a = minpix:denisity:maxpix
          hold on;
          plot(a,y,'r.');  
    end %for


end

