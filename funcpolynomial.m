function y=funcpolynomial(A)

An=length(A);   %string length

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

%% removing repeatation %%
tempA(find(tempA==0))=[];
tempA=unique(tempA);
Nvar=length(tempA);


%% finding degree of equationb %%
coeff=0;
temp=0;
degree=0;
for i=1:An
    if(double(A(i))>=97 && double(A(i))<=122)
        while(str2num(A(i+1))>=0)
            coeff=coeff*10+str2num(A(i+1));
            i=i+1;
        end
        temp = coeff;
        if temp>degree
            degree = temp;
        end
        coeff=0;
    end
end
   
%% degree of polynomial %%
z=zeros(2,degree+1);
z(1,:)=degree:-1:0;
predegree=0;
coeff=0;
precoeff=0;
ndegree=0;
count=0;
iter=0;
i=1;
coeffsign=1;
while(i<(An))
    if (count==0 & i>1)
        if(A(i-1)=='-' || A(i-1)=='—')
            coeffsign=-1;
        end
    end
    
    
    if(str2num(A(i))>=0 & count==0)
        coeff=coeff*10+str2num(A(i));
        
    elseif count==0
        iter=1;
        if A(i)=='='
            z(2,degree+1)= coeff*coeffsign;
            break;
            count=2;
        elseif double(A(i))== double(tempA)
            count=1;
        end
    end
    
    if(str2num(A(i))>=0 & count==1)
        ndegree=ndegree*10+str2num(A(i));
        
    elseif (count==1)
        if A(i)=='-' || A(i)=='—' || A(i)=='+'
            count=2;
        end
    end
    
    
    if count==2
        for j=1:degree
            if z(1,j)==ndegree
                if coeff==0
                    coeff=1;
                end
                z(2,j)= coeff*coeffsign;
                break;
            elseif ndegree==0 & i<(An-2)
                if coeff==0
                    coeff=1;
                end
                z(2,degree)= coeff*coeffsign;
                break;
            elseif (ndegree==0 & i==An)
                z(2,degree+1)= coeff*coeffsign;
                break;
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
 %z(2,:) is our coefficient matrix;

 %finding root
y= roots(z(2,:));

end