function Pr=likelihood1(tree,graph)
siz=size(tree,1);
for i=1:size(graph)-1
    vertex(i)=siz-i+1;
end;
Pr=zeros(size(graph));
for i=1:size(graph)-1
    for j=1:siz-1
        if tree(vertex(i),j) == 1
            point1=number(tree,j);
            Lr=size(point1,2);
        end;
        if tree(vertex(i),j) == 2
            point2=number(tree,j);
            Rr=size(point2,2);
        end;
    end;
    Er=0;
    for x=1:Lr
        for y=1:Rr
            if graph(point1(x),point2(y)) ~= 0
               Er = Er+1;
            end;
        end;
    end;
    pr=Er/(Lr*Rr);
    for x=1:Lr
        for y=1:Rr
            if graph(point1(x),point2(y)) == 0
                Pr(point1(x),point2(y)) = pr;
            end;
        end;
    end;
end;
Pr=Pr+Pr';
end