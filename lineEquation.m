function [k,b,num1,num2] = LineEquation(p1,p2,num1,num2)
	%�������Ϊ������������� ����k,b������
	%num1,num2 ��ʾ������dots�е������Ӷ�ȷ�����������ֱ�߷���
	k =(p2(2)-p2(1))/(p1(2)-p1(1));
	b = p2(2)-k*p1(2);
end
	 
	