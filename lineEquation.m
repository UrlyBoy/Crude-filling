function [k,b,num1,num2] = LineEquation(p1,p2,num1,num2)
	%传入参数为两点坐标和索引 返回k,b和索引
	%num1,num2 表示两点在dots中的索引从而确定那两个点的直线方程
	k =(p2(2)-p2(1))/(p1(2)-p1(1));
	b = p2(2)-k*p1(2);
end
	 
	