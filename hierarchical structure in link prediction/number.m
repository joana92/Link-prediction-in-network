function point=number(tree,vec)
%����tree�ͽڵ�vec���½��б������ҵ��ڵ�vec�µ�����Ҷ�ӽڵ�
global v;
global p;
n=0;
m=1;
t=vec;
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
for i=1:p
    for j=1:m
        if t(j)==v(i)
            n=n+1;
            point(n)=v(i);
        end;
    end;
end;
end