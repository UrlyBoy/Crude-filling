function [collection] = myFill(dots,lines,n,cdn)
%��������㷨
%   
    density = 0.1;  %����ܶ�
    dotsNum = dotsNums(dots,n,cdn); %��ȡÿ������������ʱ��ĸ���
    [maxX,maxXp,minX,minXp] = getMaxAndMin(dots,1); %��ȡ����������Ҳ��
    [maxY,maxYp,minY,minYp] = getMaxAndMin(dots,2); %��ȡ��ߵ����͵�
    collection = zeros(ceil((maxY-minY)/density),10); 
    row=1;%ɨ������collection�е�������
    %��ɨ������ÿ��ֱ�߷��̵Ľ��㡣
    for i = maxY:-density:minY
        y=i;
        count=0;  %���ÿ��ɨ�����м�������
        col=3;%�洢ɨ���߽���������� ǰ��λ�ֱ�洢���������ɨ����
        for j = 1 : n  %����ÿһ��ֱ�߷���
            k = lines(j,1);
            b = lines(j,2);
            num1 = lines(j,3);
            num2 = lines(j,4);
            if k ~= 0 
                X = (y-b)/k;
            elseif k ==Inf  %б�ʲ����ڵ����
                X = dots(num1,1);
            end %if
            if X>=min(dots(num1,1),dots(num2,1))&&X<=max(dots(num1,1),dots(num2,1))
                count=count+1;
                collection(row,col)=X;
                col = col+1; %ָ����һ��λ��
             end %if
        end %for
        collection(row,1)=count; %������ĸ�������ÿ�еĵ�һ��λ��
         collection(row,2)=y; %�洢ɨ����
        row = row+1; %ָ����һ�� ��ʼ�洢�ڶ���ɨ���ߵĽ���
    end  %for
   % maxCount = max(collection(:,1));
    
    %��ʼ���
    for j = 1:ceil((maxY-minY)/density)
        count = collection(j,1);
        Xp = sort(collection(j,3:count+2)); %����ɨ���߽������ݵ�������
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

