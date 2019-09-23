function [collection] = myFill(dots,lines,n,cdn)
%区域填充算法
%   
    density = 0.1;  %填充密度
    dotsNum = dotsNums(dots,n,cdn); %获取每个顶点代表填充时点的个数
    [maxX,maxXp,minX,minXp] = getMaxAndMin(dots,1); %获取最左侧点和最右侧点
    [maxY,maxYp,minY,minYp] = getMaxAndMin(dots,2); %获取最高点和最低点
    collection = zeros(ceil((maxY-minY)/density),10); 
    row=1;%扫描线在collection中的行索引
    %求扫描线与每条直线方程的交点。
    for i = maxY:-density:minY
        y=i;
        count=0;  %标记每条扫描线有几个交点
        col=3;%存储扫描线交点的列索引 前两位分别存储交点个数和扫描线
        for j = 1 : n  %遍历每一条直线方程
            k = lines(j,1);
            b = lines(j,2);
            num1 = lines(j,3);
            num2 = lines(j,4);
            if k ~= 0 
                X = (y-b)/k;
            elseif k ==Inf  %斜率不存在的情况
                X = dots(num1,1);
            end %if
            if X>=min(dots(num1,1),dots(num2,1))&&X<=max(dots(num1,1),dots(num2,1))
                count=count+1;
                collection(row,col)=X;
                col = col+1; %指向下一个位置
             end %if
        end %for
        collection(row,1)=count; %将交点的个数存在每行的第一个位置
         collection(row,2)=y; %存储扫描线
        row = row+1; %指向下一行 开始存储第二条扫描线的交点
    end  %for
   % maxCount = max(collection(:,1));
    
    %开始描点
    for j = 1:ceil((maxY-minY)/density)
        count = collection(j,1);
        Xp = sort(collection(j,3:count+2)); %将该扫描线交点数据递增排序
        if(mod(count,2)==1)
            for i = 1:count
                if i ~=count
                    redPoint(Xp(i),Xp(i+1),collection(j,2));
                end %if
            end %for
        elseif mod(count,2)==0
                for i = 1:2:count
                    redPoint(Xp(i),Xp(i+1),collection(j,2));
                end
                    
                    %
        end %end if
    end %for
end % myFill

