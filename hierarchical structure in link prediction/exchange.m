function [lastLd,lasttree]=exchange(tree,graph)
%将树tree的各节点进行交换，最终得到所需的树lasttree及所对应的lastLd
global value;
global cpoint;
siz=size(tree);
siz2=size(graph);
maxLd=likelihood(tree,graph);
lasttree=tree;
tempLd1=-Inf;
aa=5;
bb=1;
while aa>=1
    [~,vertex]=sort(rand(1,size(graph)));
    i=vertex(1);
    if aa>1
        [~,vertex]=sort(rand(1,size(graph)-2));
        jj=vertex(2)+size(graph,1);
    else
        if bb==1
            tempLd1=-Inf;
            bb=2;
        end;
        jj=vertex(2);
    end;
    mark=0;
    temptree=lasttree;
    vi(2)=0;vi(3)=0;fl=0;
    for m=1:siz
        if temptree(m,i)~=0
            vi(2)=m;
            break;
        end;
    end;
    for m=1:siz
        if temptree(m,jj)~=0
            vi(3)=m;
            break;
        end;
    end;
    child1=father(temptree,i);
    for m=1:size(child1,2)
        if jj==child1(m)
            fl=1;
            break;
        end;
    end;
    if fl==0
        child2=father(temptree,jj);
        for m=1:size(child2,2)
            if i==child2(m)
                fl=1;
                break;
            end;
        end;
    end;
    if vi(2)~=vi(3) && fl~=1
        if i<=siz2 & jj<=siz2
            tempcpoint=cpoint;
            temp=cpoint(i);
            cpoint(i)=cpoint(jj);
            cpoint(jj)=temp;
        end;
        t=temptree(:,i);
        temptree(:,i)=temptree(:,jj);
        temptree(:,jj)=t;
        tempLd=likelihood(temptree,graph);
        if tempLd~=-Inf
            tempLd
            tempLd1
            maxLd
            if maxLd-tempLd < aa*value && abs(tempLd-tempLd1) < aa*value
                if mark~=1 & i<=siz2 & jj<=siz2
                    cpoint=tempcpoint;
                end;
                aa=aa-1;
            end;
            if tempLd > maxLd
                maxLd = tempLd;
                lasttree=temptree;
                mark=1;
            else
                probability=2.^(tempLd-maxLd);
                while probability>=1
                    probability=probability/10;
                end;
                if rand<probability
                    maxLd = tempLd;
                    lasttree=temptree;
                    mark=1;
                else
                    tempLd1=tempLd;
                end;
            end;
            if mark~=1 & i<=siz2 & jj<=siz2
                cpoint=tempcpoint;
            end;
        end;
    end;
end;
lastLd=maxLd;
end