function [lastLd,lasttree]=tempresult()
%�����ɵ���������м��飬���ϸ�����������
%Ld��Ӧ�����tree��lastLd��Ӧ����������lasttree
global cpoint;
global v;
global p;
global vv;
global pp;
Ld=-Inf;
while Ld==-Inf
    [tree,graph]=construct;
    siz=size(tree);
    p=0;
    pp=0;
    for i=1:size(graph)
        p=p+1;
        v(p)=i;
        cpoint(p)=i;
    end;
    for i=size(graph)+1:siz
        pp=pp+1;
        vv(pp)=i;
    end;
    Ld=likelihood(tree,graph);
    if Ld~=-Inf
        for i=1:siz
            for j=1:siz
                if tree(i,j)~=0 && tree(j,i)~=0
                    Ld=-Inf;
                    break;
                end;
            end;
            if Ld==-Inf
                break;
            end;
        end;
    end;
    if Ld~=-Inf
        for i=size(graph)+1:siz
            tempchild=father(tree,i);
            for j=1:size(tempchild,2)
                for m=j+1:size(tempchild,2)
                    if tempchild(j)==tempchild(m)
                        Ld=-Inf;
                        break;
                    end;
                end;
                if Ld==-Inf
                    break;
                end;
            end;
            if Ld==-Inf
                break;
            end;
        end;
    end;
end;
[lastLd,lasttree]=exchange(tree,graph);
end