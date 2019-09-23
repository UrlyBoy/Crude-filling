function [dotsnum] = dotsNums( dots,n,cdn )
%计算一个顶点代表几个点的函数
%   传入 外环顶点个数，内环顶点个数，返回每个顶点代表的个数数组按位置存储
    dotsnum = rand(n,1);
    for i = 1:(n-cdn)
        y = dots(i,2);
        if i ==1 %第一个点
            t = (y-dots(i+1,2))*(y-dots(n-cdn,2));
        elseif i==(n-cdn)  %最后一个点
            t = (y-dots(i-1,2))*(y-dots(1,2));
        else
            t = (y-dots(i-1,2))*(y-dots(i+1,2));
        end
        if t<0
            dotsnum(i)=1;
        else 
            dotsnum(i)=2;
        end % 判断当前点表示几个点
    end %for
    %判断内环的点数
    for j = n-cdn+1:n
        y = dots(j,2);
        if j == n-cdn+1
            t = (y-dots(n-cdn+2,2))*(y-dots(n,2));
        elseif j==n
            t = (y-dots(j-1,2))*(y-dots(n-cdn+1,2));
        else
            t = (y-dots(j-1,2))*(y-dots(j+1,2));
        end %end if
        if t<0
            dotsnum(j)=1;
        else 
            dotsnum(j)=2;
        end %end if
    end %end for
end  %dotsNums

