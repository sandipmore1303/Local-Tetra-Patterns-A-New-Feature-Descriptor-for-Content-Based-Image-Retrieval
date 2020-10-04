

% Input: Imagemage; Output: Faeture vector
% 1. Load the image, and convert it into grayscale.
close all;clear all;
clc;

global Lookup Feature_Database;
Lookup=xlsread('Lookup.xlsx', 'Sheet1');
% Feature_Database=xlsread('Feature_Database.xlsx', 'Sheet1');
path='DB1000';

Files=dir(fullfile(path,'*.jpg'));
F=zeros(12,13*58);
for i=0:11
Filepath=[path,'\',int2str(i),'.jpg']
M=Extract_Feature(Filepath);
for k=1:13*58
    F(i+1,k)=M(k);
end
rng=['A',int2str(i+1),':','A',int2str(i+1)];
d={Filepath};
[stat msg] =xlswrite('Feature_Database.xlsx', d,rng);

rng=['B',int2str(i+1),':','B',int2str(i+1)];
d={(i-mod(i,2))/2};
[stat msg] =xlswrite('Feature_Database.xlsx', d,rng);

end

savefile = 'D:\Feature.mat';
save(savefile, 'F');

 