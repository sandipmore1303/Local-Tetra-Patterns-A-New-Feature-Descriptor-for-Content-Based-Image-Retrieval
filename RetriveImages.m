

% Input: Imagemage; Output: Faeture vector
% 1. Load the image, and convert it into grayscale.
close all;clear all;
clc;
load 'Feature_1000.mat';
First_N_number_of_images=3;% no of first n images to retrieve

global Lookup ;
Lookup=xlsread('Lookup.xlsx', 'Sheet1');
% Feature_Database=xlsread('Feature_Database.xlsx', 'Sheet1');
path='DB1000'; % training db
ipath='DB1000\801.jpg';% test image path
 


figure('Name','Query image','NumberTitle','off')
   
   imshow(ipath);
   
   
EF= Extract_Feature(ipath);


D=zeros(1,1000);
for i=0:0  % number of testing images
   for j=0:999 % no of images in training databse
       for k=1:13*58
           D(i+1,j+1)=D(i+1,j+1)+abs((F(j+1,k)-EF(i+1,k))/(1+F(j+1,k)+EF(i+1,k)));
       end
   end
   
   for lll=1:1000
    Dr(lll)=D(i+1,lll);
   end
    [B,IX] = sort(Dr);


    for mmm=1:First_N_number_of_images
      Filepath=[path,'\',int2str(IX(mmm)-1),'.jpg'];
     figure('Name','Retrived image','NumberTitle','off')
      imshow(Filepath); 
    end


 
end
 



 