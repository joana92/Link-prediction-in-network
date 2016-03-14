function [tree,graph]=construct()
%将所给矩阵数据生成图graph和随机树tree
global arg;
arg=arg+1;
a=load('a.mat');
graph=a.aa;
siz=2*size(graph)-1;
tree=zeros(siz);
[~,n]=sort(rand(1,size(graph)));
tree(size(graph)+1,n(1))=2;
tree(size(graph)+1,n(2))=1;
for i=1:size(graph)-2
    tree(size(graph)+1+i,n(i+2))=2;
    tree(size(graph)+1+i,size(graph)+i)=1;
end;
end