function [lastLd,lasttree]=main1(n)
tic;
global arg;
arg=0;
global value;
value=1;
%global arg;
%arg=0;
lasttree=cell(1,n);
for i=1:n
    [Ld,tree]=tempresult;
    lastLd(1,i)=Ld;
    lasttree(1,i)={tree};
    i
end;
toc
end
