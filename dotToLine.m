function [dots,lines,n,cdn] = dotToLine(n,cdn)
	%n stand for the number of dot. iscircle stand for the number of circle's dots.
	%only have one circle
	lines=rand(n,4); %前两个位置分别存储k,b,后两个位置存储的是两个点的索引
	hf = figure; %generate a figure
	xlim([0,10]);  %限制x轴的范围
    ylim([0,10]);   %限制yz轴的范围
	dots = ginput(n); %capture the number of dots that is n
	%dots = dots'; %reverse the matrix
	count = 1; %
    ep=0;
    %将两个点连线 并产生直线方程相关参数
	for a = 1:(n-cdn-1)
		line([dots(a,1),dots(a+1,1)],[dots(a,2),dots(a+1,2)]);
        [k,b,num1,num2]=lineEquation([dots(a,1),dots(a+1,1)],[dots(a,2),dots(a+1,2)],a,a+1); %get line's k and b;
        lines(count,1)=k;
        lines(count,2)=b;
        lines(count,3)=num1;
        lines(count,4)=num2;
        count=count+1; %存储下一条线
		ep = a; %record the last point num
	end
	
	line([dots(ep+1,1),dots(1,1)],[dots(ep+1,2),dots(1,2)]);	%close the outside circle
    [k,b,num1,num2]=lineEquation([dots(ep+1,1),dots(1,1)],[dots(ep+1,2),dots(1,2)],ep+1,1); %get line's k and b;
        lines(count,1)=k;
        lines(count,2)=b;
        lines(count,3)=num1;
        lines(count,4)=num2;
        count=count+1;
    
    if cdn>0
        sp = ep+2; %内环的第一个点索引
        for b = sp:n-1
            line([dots(b,1),dots(b+1,1)],[dots(b,2),dots(b+1,2)]);
            [k,s,num1,num2]=lineEquation([dots(b,1),dots(b+1,1)],[dots(b,2),dots(b+1,2)],b,b+1); %get line's k and b;
            lines(count,1)=k;
            lines(count,2)=s;
            lines(count,3)=num1;
            lines(count,4)=num2;
            count=count+1;
		
          end
    
        line([dots(n,1),dots(sp,1)],[dots(n,2),dots(sp,2)]); %闭合内环
        [k,b,num1,num2]=lineEquation([dots(n,1),dots(sp,1)],[dots(n,2),dots(sp,2)],n,sp); 
        lines(count,1)=k;
        lines(count,2)=b;
        lines(count,3)=num1;
        lines(count,4)=num2;
    end
end %dotToLine