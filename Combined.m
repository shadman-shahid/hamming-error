clc;
clear all;
clearvars;

%% Browse File %%
[FileName,PathName] = uigetfile({'*.jpg';'*.jpeg';'*.png'},'Select your image file');
fullpathname= strcat(PathName, FileName);
a = imread(fullpathname);
tex=ocr(a);
T=tex.Text;
degree=5;
for i=1:length(T)
    
    if (double(T(i))==10)
        T(i)=';';
        if (double(T(i+1))==10)
            T(i+1)=[];
        end
    end
    if (T(i)=='O' || T(i)=='o')
        T(i)='0';
    end
     if (i+1)>length(T)
        break;
     end
    %% convert uppercase to lowercase %%
    if((double(T(i))>=65 && double(T(i))<=90))
        T(i)= char(double(T(i))+32);
    end
end

%% coping data to a txt file %%
fileID=fopen('extracted.txt', 'w');
fprintf(fileID, T);
fprintf(fileID,'\n');
fclose(fileID);
fulltextpath= strcat(PathName, 'extracted.txt');

%% Reading File %%
A=fileread(fulltextpath);
An=length(A)

%% Selecting type of equation %%
 [Nline,N]=funcNvar(A);
 
 if length(T)==0
     degree=input('Input desired degree of polynomial: ');
     res=graphing(fullpathname, degree);
     disp(res);
 elseif N==1 & Nline==0
     res=funcpolynomial(A);
     disp(res);
 elseif N>=1 & Nline==0
     res=funclinear(A);
     disp(res);
 else 
     res=simplification(A);
     disp(res);
 end
     



