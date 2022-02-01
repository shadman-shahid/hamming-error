function y=simplify(A)


format long

An=length(A);   %string length
An=An;

line=length(find(A==';'));
B=zeros(1,line+1);
linecnt=1;
A=['(' A];
%j=1;
start=1;
for i=1:length(A)
    
    if i>length(A)
        break;
    end
    
    if A(i)=='>'|| A(i)=='X' || A(i)=='x'
        A(i)='*';
        if A(i+1)=='<'
            A(i+1)=[];
        end
    end
    
    if A(i)=='—'
        A(i)='-';
    end
    if A(i)=='{'
        A(i)='(';
    end
    if A(i)=='}'
        A(i)=')';
    end
    if A(i)=='['
        A(i)='(';
    end
    if A(i)==']'
        A(i)=')';
    end
    if A(i)==' '
        A(i)=[];
    end
    if A(i)==';' 
       A(i)=')';
       B(linecnt)=str2num(A(start:i))
       A(i)='(';
       linecnt=linecnt+1;
       start=i;
    end
    
end
for i=1:line-1
     B(line-i)=B(line-i)/B(line-i+1) ;
end
y=B(1);

end



