function point=father(tree,vec)
%����tree���ڵ�vec���±������ҵ��ڵ�vec�µ����з�Ҷ�ӽڵ�
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