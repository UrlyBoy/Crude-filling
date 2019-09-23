function [dots,lines,n,cdn] = dotToLine(n,cdn)
	%n stand for the number of dot. iscircle stand for the number of circle's dots.
	%only have one circle
	lines=rand(n,4); %ǰ����λ�÷ֱ�洢k,b,������λ�ô洢���������������
	hf = figure; %generate a figure
	xlim([0,10]);  %����x��ķ�Χ
    ylim([0,10]);   %����yz��ķ�Χ
	dots = ginput(n); %capture the number of dots that is n
	%dots = dots'; %reverse the matrix
	count = 1; %
    ep=0;
    %������������ ������ֱ�߷�����ز���
	for a = 1:(n-cdn-1)
		line([dots(a,1),dots(a+1,1)],[dots(a,2),dots(a+1,2)]);
        [k,b,num1,num2]=lineEquation([dots(a,1),dots(a+1,1)],[dots(a,2),dots(a+1,2)],a,a+1); %get line's k and b;
        lines(count,1)=k;
        lines(count,2)=b;
        lines(count,3)=num1;
        lines(count,4)=num2;
        count=count+1; %�洢��һ����
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
        sp = ep+2; %�ڻ��ĵ�һ��������
        for b = sp:n-1
            line([dots(b,1),dots(b+1,1)],[dots(b,2),dots(b+1,2)]);
            [k,s,num1,num2]=lineEquation([dots(b,1),dots(b+1,1)],[dots(b,2),dots(b+1,2)],b,b+1); %get line's k and b;
            lines(count,1)=k;
            lines(count,2)=s;
            lines(count,3)=num1;
            lines(count,4)=num2;
            count=count+1;
		
          end
    
        line([dots(n,1),dots(sp,1)],[dots(n,2),dots(sp,2)]); %�պ��ڻ�
        [k,b,num1,num2]=lineEquation([dots(n,1),dots(sp,1)],[dots(n,2),dots(sp,2)],n,sp); 
        lines(count,1)=k;
        lines(count,2)=b;
        lines(count,3)=num1;
        lines(count,4)=num2;
    end
end %dotToLine