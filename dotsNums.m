function [dotsnum] = dotsNums( dots,n,cdn )
%����һ�������������ĺ���
%   ���� �⻷����������ڻ��������������ÿ���������ĸ������鰴λ�ô洢
    dotsnum = rand(n,1);
    for i = 1:(n-cdn)
        y = dots(i,2);
        if i ==1 %��һ����
            t = (y-dots(i+1,2))*(y-dots(n-cdn,2));
        elseif i==(n-cdn)  %���һ����
            t = (y-dots(i-1,2))*(y-dots(1,2));
        else
            t = (y-dots(i-1,2))*(y-dots(i+1,2));
        end
        if t<0
            dotsnum(i)=1;
        else 
            dotsnum(i)=2;
        end % �жϵ�ǰ���ʾ������
    end %for
    %�ж��ڻ��ĵ���
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

