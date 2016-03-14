function Ld=likelihood(tree,graph)
%根据树tree和图graph进行计算，得出Ld
global vv;
global pp;
global cpoint;
siz=size(tree);
Ld=1;
for i=1:pp
    for j=1:siz
        if tree(vv(i),j) == 1
            point1=number(tree,j);
            Lr=size(point1,2);
        end;
        if tree(vv(i),j) == 2
            point2=number(tree,j);
            Rr=size(point2,2);
        end;
    end;
    Er=0;
    for x=1:Lr
        for y=1:Rr
 %           if graph(point1(x),point2(y)) ~= 0
            if graph(cpoint(point1(x)),cpoint(point2(y))) ~= 0
               Er = Er+1;
            end;
        end;
    end;
    Pr=Er/(Lr*Rr);
    if Pr==0
        Ld=0;
        break;
    end;
    Ld = Ld*(Pr.^Er)*(1-Pr).^(Lr*Rr-Er); 
end;
Ld=log2(Ld);
end