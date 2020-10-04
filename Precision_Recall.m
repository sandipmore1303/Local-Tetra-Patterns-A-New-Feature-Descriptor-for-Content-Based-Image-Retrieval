

% Input: Imagemage; Output: Faeture vector
% 1. Load the image, and convert it into grayscale.
close all;clear all;
clc;
load 'Feature_1000.mat';
n=10;% no of first n images to retrieve
 
 
 
   
   
 


D=zeros(1000,1000);
for i=0:999  % number of testing images
   for j=0:999 % no of images in training databse
       for k=1:13*58
           D(i+1,j+1)=D(i+1,j+1)+abs((F(j+1,k)-F(i+1,k))/(1+F(j+1,k)+F(i+1,k)));
       end
   end
   
    
    [B,IX] = sort(D(i+1,:));
    for mmm=0:999
    Dr(i+1,mmm+1)=B(mmm+1);
    IXr(i+1,mmm+1)=IX(mmm+1);
%     IXir(i+1,mmm)=cast( uint8(IX(mmm)/100),'int8');
%     IXir(i+1,mmm+1)=cast( ( (IX(mmm+1)-1) /100),'int8');
    IXir(i+1,mmm+1)= floor( (IX(mmm+1)-1) /100) ;
    end

%     for mmm=1:n
%       %Filepath=[path,'\',int2str(IX(mmm)-1),'.jpg'];
%      
%     end


 
end
 



 