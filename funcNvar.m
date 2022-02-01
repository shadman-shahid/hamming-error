function [line,y]=funcNvar(A)
An=length(A);   %string length
An=An-1;

%Finding Number of variable
Nvar=0;  %number of variable
tempA=zeros(1,An);
tempNvar=An;
k=1;
line=1;
for i=1:An
    if((double(A(i))>=65 && double(A(i))<=90) || (double(A(i))>=97 && double(A(i))<=122))
        tempA(k)=A(i);
        k=k+1;
    end
end
for i=1:An
    if A(i)=='='
        line=0;
        break;
    end
end
k=1;
tempA(find(tempA==0))=[];
tempA=unique(tempA);
Nvar=length(tempA);
y=Nvar;
end