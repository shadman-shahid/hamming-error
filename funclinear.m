function y=funclinear(A)

An=length(A);   %string length
An=An;

%Finding Number of variable
Nvar=0;  %number of variable
tempA=zeros(1,An);
tempNvar=An;
k=1;
for i=1:An
    
    if((double(A(i))>=65 && double(A(i))<=90) || (double(A(i))>=97 && double(A(i))<=122))
        tempA(k)=A(i);
        k=k+1;
    end
end
k=1;
tempA(find(tempA==0))=[];
tempA=unique(tempA);
Nvar=length(tempA);


%Number of variable =Nvar
%input array=A
z=zeros(Nvar,Nvar+1);
predegree=0;
coeff=0;
precoeff=0;
constNum=0;
count=0;
iter=0;
i=1;
k=1;
coeffsign=1;
while(i<=An)
    if (count==0 & i>1)
        if(A(i-1)=='-' || A(i-1)=='—')
            coeffsign=-1;
        end
    end
    
    
    if(str2num(A(i))>=0)
        coeff=coeff*10+str2num(A(i));
        
    elseif(A(i)==';')

        z(k,Nvar+1)=coeff*coeffsign;
        coeff=0;
        coeffsign=1;
        k=k+1;
    else
        iter=1;
        count=count+1;      
    end
    
    
    if count==1
        for j=1:Nvar
            if tempA(j)==double(A(i))
                if coeff==0;
                    z(k,j)=1*coeffsign;
                    break;
                else
                    z(k,j)=coeff*coeffsign;
                    break;
                end
            end
        end

        ndegree=0;
        coeff=0;
        count=0;
        iter=0;
        coeffsign=1;
    end
    i=i+1;
end
disp(z);
k=z(:,Nvar+1);
z(:,Nvar+1)=[];
p=pinv(z)*k;
y=p;

end
