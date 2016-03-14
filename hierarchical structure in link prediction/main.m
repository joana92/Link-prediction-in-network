function [result1,result2,Pr,lastPr]=main(n)
%主函数，n表示进行运算的次数
tic;
global value;
value=0.1;
result2=cell(1,n);
lastLd=tempresult;
j=0;
while j<=n
    [Ld,tree]=tempresult;
    if abs(lastLd-Ld) <= value/2
        j=j+1
        result1(1,j)=Ld;
        result2(1,j)={tree};
    end;
end;
a=load('a.mat');
graph=a.aa;
Pr=cell(1,n);
temppr=zeros(size(graph));
for i=1:n
    temptree=result2{1,i};
    Pr(1,i)={likelihood1(temptree,graph)};
    temppr=temppr+Pr{1,i};
end;
temppr=temppr/n;
q=0;
for i=1:size(graph)
    for j=i:size(graph)
        if temppr(i,j)~=0
            q=q+1;
            lastPr(q,1)=temppr(i,j);
            lastPr(q,2)=100*i+j;
        end;
    end;
end;
lastPr=sortrows(lastPr,-1);
toc
end