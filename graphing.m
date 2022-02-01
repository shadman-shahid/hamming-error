function y=graphing(path,degree)
I=imread(path);
text=ocr(I);
I=rgb2gray(I);
I2=imbinarize(I);

%I2=imresize(I2, [ NaN]);
%I4=I2.';
imshow(I2);
flag=1;

[m,n] = size(I2);
for i=1:m
    I3=I2(i,:);
    k=find(~I3);
    if isempty(k)==0 && flag==1
        xmin=k(length(k));
        ymin=i
        flag=0;
    end 
end
flag=1;
for i=n:-1:1
    I3=I2(:,i);
    k=find(~I3);
    if isempty(k)==0 && flag==1
        xlen=i-xmin;
        flag=0;
    end 
end

   I3=I2(:,floor(n/2));
   I3=flip(I3);
   k=find(I3==0)
   ylen=m-ymin-k(1)
   

I3 = imcrop(I2,[xmin+3 ymin xlen ylen-4]); 
figure(1), imshow(I3)
I3=flip(I3);

[row,col] = find(I3==0);


x1=linspace(1,length(col),degree);
y1=linspace(1,length(row),degree);

xx= col(ceil(x1));
yy= row(ceil(y1));


figure(2), plot(xx,yy);

n=length(xx);
s=0;
for i=1:n
    p=1;
    for j=1:n
        if j~=i
        p=conv(p,[1 -xx(j)] /( xx(i)-xx(j) )  );
        end
    end
    s=s+p*yy(i);
end
%s=round(s,10)

xxx=linspace(1,xx(n),100);
yyy=polyval(s,xxx);

figure (3), plot(xxx,yyy,'r')
y=s;

end

