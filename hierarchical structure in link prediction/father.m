function point=father(tree,vec)
%对树tree及节点vec向下遍历，找到节点vec下的所有非叶子节点
global vv;
global pp;
n=0;
m=1;
t=vec;
point=0;
for i=1:size(tree)
    if i>m
        break;
    end;
    for j=1:size(tree)
        if tree(t(i),j)~=0
            m=m+1;
            t(m)=j;
        end;
    end;
end;
for i=1:pp
    for j=1:m
        if t(j)==vv(i)
            n=n+1;
            point(n)=vv(i);
        end;
    end;
end;
end