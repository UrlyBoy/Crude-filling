# -
简陋版区域填充算法的MatLab实现
**该算法适用于没有内环或只有一个内环的情况。**
[dots,lines,n1,n2]=dotToLine(n1,n2)
## n1表示要输入顶点的总个数，n2表示内环的顶点个数
myFill(dots,lines,n1,n2)

*** 

# 运行方法：
   
  ## 1. 在matlab中新建一个文件夹，并将上述函数文件复制到该文件夹中
  ## 2. 将matlab的当前文件路径切换到该文件夹
  ## 3. 先运行[dots,lines,n1,n2]=dotToLine(n1,n2),并在坐标图中单击鼠标左键点相应的点数目
  ## 4. 将dotToLine返回的参数 dots,lines,n1,n2 依次放入myFill(dots,lines,n1,n2) 即可完成填充
  

  
