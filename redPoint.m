function [ px1,px2,y ] = redPoint(px1,px2,y)
%给定坐标区间将该区间坐标描红默认间隔是0.1
%  
    denisity = 0.08;
    minpix = min(px1,px2);
    maxpix = max(px1,px2);
    for a = minpix:denisity:maxpix
          hold on;
          plot(a,y,'r.');  
    end %for


end

