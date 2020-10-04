

% Input: Imagemage; Output: Faeture vector

% 1. Load the image, and convert it into grayscale.
 
global I I_1_direction;
% I=zeros(5,5);
% 
% I(1,1)=2;
% I(1,2)=5;
% I(1,3)=3;
% I(1,4)=9;
% I(1,5)=1;
% 
% 
% 
% 
% I(2,1)=6;
% I(2,2)=7;
% I(2,3)=9;
% I(2,4)=1;
% I(2,5)=5;
% 
% 
% 
% I(3,1)=2;
% I(3,2)=3;
% I(3,3)=4;
% I(3,4)=8;
% I(3,5)=2;
% 
% 
% I(4,1)=3;
% I(4,2)=8;
% I(4,3)=3;
% I(4,4)=2;
% I(4,5)=9;
% 
% 
% I(5,1)=1;
% I(5,2)=2;
% I(5,3)=3;
% I(5,4)=2;
% I(5,5)=1;
% 
% [N1 N2]=size(I);  % size N1*N2

I1=imread('DB1\8.jpg');   % read image

[N1 N2]=size(I);  % size N1*N2


% take random image
 I=randi(255,size(I));
% 2. Apply the first-order derivatives in horizontal and vertical  axis.
I_0_degree=zeros(N1,N2);
I_90_degree=zeros(N1,N2);

%I_90
%first row
for m=1:1
    for n=1:N2
        I_90_degree(m,n)=0-I(m,n);
    end
end


for m=2:N1
    for n=1:N2
        I_90_degree(m,n)=I(m-1,n)-I(m,n);
    end
end

%I_0
%
for m=1:N1
    for n=N2:N2
        I_0_degree(m,n)=0-I(m,n);
    end
end


for m=1:N1
    for n=1:N2-1
        I_0_degree(m,n)=I(m,n+1)-I(m,n);
    end
end

% 3. Calculate the direction for every pixel.
I_1_direction=zeros(N1,N2);
for m=1:N1
    for n=1:N2  
        
        if(I_0_degree(m,n) >=0  && I_90_degree(m,n) >= 0)
            I_1_direction(m,n) =1;
        end
        if(I_0_degree(m,n) <0  &&  I_90_degree(m,n) >=0)
            I_1_direction(m,n)=2;
        end
        if(I_0_degree(m,n) <0  &&  I_90_degree(m,n) <0)
            I_1_direction(m,n)=3;
        end
        if(I_0_degree(m,n) >=0  && I_90_degree(m,n)  <0)
            I_1_direction(m,n)=4;
        end

        
    end
end



% 4. Divide the patterns into four parts based on the direction of the center pixel.

%  Calculate the tetra patterns, and separate them into three  binary patterns.

LTrP=zeros(N1,N2,8);
% 
% for m=3:3
%     for n=3:3 
%       temp=second_order_LTrP_of_pixel(m,n);
%       for i=1:8
%         LTrP(m,n,i)=  temp(i);
%       end    
%     end
% end

for m=2:N1-1
    for n=2:N2-1 
      temp=second_order_LTrP_of_pixel(m,n);
      for i=1:8
        LTrP(m,n,i)=  temp(i);
      end    
    end
end

   % Calculate Histograms for binary patterns     
 
  Hs_1_2=zeros(1,58);
  Hs_1_3=zeros(1,58);
  Hs_1_4=zeros(1,58);
  
  Hs_2_1=zeros(1,58);
  Hs_2_3=zeros(1,58);
  Hs_2_4=zeros(1,58);
  
  Hs_3_1=zeros(1,58);
  Hs_3_2=zeros(1,58);
  Hs_3_4=zeros(1,58);
  
  Hs_4_1=zeros(1,58);
  Hs_4_2=zeros(1,58);
  Hs_4_3=zeros(1,58);
  TP_1_2=0;
  TP_1_3=0;
  TP_1_4=0;
  
  TP_2_1=0;
  TP_2_3=0;
  TP_2_4=0;
  
  TP_3_1=0;
  TP_3_2=0;
  TP_3_4=0;
  
  TP_4_1=0;
  TP_4_2=0;
  TP_4_3=0;
  
for m=2:N1-1
    for  n=2:N2-1      
        if(I_1_direction(m,n) ==1)                     
            %calculate tetra pattern for directions 2,3,4   TP_1_2 ,TP_1_3,TP_1_4 and             associated
            %histograms Hs_1_2 ,Hs_1_3,Hs_1_4  
             
             TP_1_2=0;
             
             
            for i=1:8
                if(LTrP(m,n,i)==2)                     
                    TP_1_2=TP_1_2+2^(8-i);
                end
            end
         %check if patern value is one with <=2 discontinuties in circular
         %representation by looking up table of lookupup
         
         index=LookupTable(TP_1_2);
         if(index~=-1)
             Hs_1_2(index)=Hs_1_2(index)+1;
         end
         
            TP_1_3=0;
            for i=1:8
                if(LTrP(m,n,i)==3)  
                    TP_1_3=TP_1_3+2^(8-i);
                end
            end
         
            %check if patern value is one with <=2 discontinuties in circular representation by looking up table of  
        
         index=LookupTable(TP_1_3);
         
             if(index~=-1)         
             Hs_1_3(index)=Hs_1_3(index)+1;
             end
             
             
             
              TP_1_4=0;
            for i=1:8
                if(LTrP(m,n,i)==4)  
                    TP_1_4=TP_1_4+2^(8-i);
                end
            end
            
         index=LookupTable(TP_1_4);
         
             if(index~=-1)         
             Hs_1_4(index)=Hs_1_4(index)+1;
             end           
             
        end  
        
         if(I_1_direction(m,n)==2)
            
            
            %calculate tetra pattern for directions 1,3,4   TP_2_1 ,TP_2_3,TP_2_4 and             associated
            %histograms Hs_2_1 ,Hs_2_3,Hs_2_4
            
            TP_2_1=0;
            for i=1:8
                if(LTrP(m,n,i)==1)  
                    TP_2_1=TP_2_1+2^(8-i);
                end
            end
            
          index=LookupTable(TP_2_1);
         
             if(index~=-1)         
            Hs_2_1(index)=Hs_2_1(index)+1;
             end
            
             
             
             TP_2_3=0;
            for i=1:8
                if(LTrP(m,n,i)==3)  
                    TP_2_3=TP_2_3+2^(8-i);
                end
            end
           index=LookupTable(TP_2_3);
         
             if(index~=-1)         
           Hs_2_3(index)=Hs_2_3(index)+1;
             end
            
             
             TP_2_4=0;
            for i=1:8
                if(LTrP(m,n,i)==4)  
                    TP_2_4=TP_2_4+2^(8-i);
                end
            end
            
             index=LookupTable(TP_2_4);
         
             if(index~=-1)         
              Hs_2_4(index)=Hs_2_4(index)+1;
             end
                   
        end
         
        if(I_1_direction(m,n)==3)
            
            TP_3_1=0;
            for i=1:8
                if(LTrP(m,n,i)==1)  
                    TP_3_1=TP_3_1+2^(8-i);
                end
            end
            
             index=LookupTable(TP_3_1);
         
             if(index~=-1)         
          
             Hs_3_1(index)=Hs_3_1(index)+1;
             end
             
             
             
             TP_3_2=0;
            for i=1:8
                if(LTrP(m,n,i)==2)  
                    TP_3_2=TP_3_2+2^(8-i);
                end
            end
            
            index=LookupTable(TP_3_2);
         
             if(index~=-1)         
         
             Hs_3_2(index)=Hs_3_2(index)+1;
             end
             
             
             
             
             TP_3_4=0;
            for i=1:8
                if(LTrP(m,n,i)==4)  
                    TP_3_4=TP_3_4+2^(8-i);
                end
            end
            
             index=LookupTable(TP_3_4);
         
             if(index~=-1)  
                 Hs_3_4(index)=Hs_3_4(index)+1;            
             
             end
             
                   
        end
        
        if(I_1_direction(m,n)==4)
                  
             TP_4_1=0;
            for i=1:8
                if(LTrP(m,n,i)==1)  
                    TP_4_1=TP_4_1+2^(8-i);
                end
            end
             
        index=LookupTable(TP_4_1);
         
             if(index~=-1)         
              Hs_4_1(index)=Hs_4_1(index)+1;            
             end
            
             TP_4_2=0;
            for i=1:8
                if(LTrP(m,n,i)==2)  
                    TP_4_2=TP_4_2+2^(8-i);
                end
            end
            
             index=LookupTable(TP_4_2);
         
             if(index~=-1)         
               Hs_4_2(index)=Hs_4_2(index)+1;            
             end
             
             
             TP_4_3=0;
            for i=1:8
                if(LTrP(m,n,i)==3)  
                    TP_4_3=TP_4_3+2^(8-i);
                end
            end
            
             index=LookupTable(TP_4_3);
         
             if(index~=-1)         
                Hs_4_3(index)=Hs_4_3(index)+1;            
             
             end
            
            
            
        end
        
    end
end



%calculate LTrP2 based on direction of center pixel




% 6. Calculate the histograms of binary patterns.


%   Hs_1_2=Hs_1_2/(N1*N2);
%   Hs_1_3=Hs_1_3/(N1*N2);
%   Hs_1_4=Hs_1_4/(N1*N2);
%   
%   Hs_2_1=Hs_2_1/(N1*N2);
%   Hs_2_3=Hs_2_3/(N1*N2);
%   Hs_2_4=Hs_2_4/(N1*N2);
%   
%   Hs_3_1=Hs_3_1/(N1*N2);
%   Hs_3_2= Hs_3_2/(N1*N2);
%   Hs_3_4=Hs_3_4/(N1*N2);
%   
%   Hs_4_1=Hs_4_1/(N1*N2);
%   Hs_4_2=Hs_4_2/(N1*N2);
%   Hs_4_3=Hs_4_3/(N1*N2);
  



% 7. Calculate the magnitudes of center pixels using (13).  
LP=zeros(N1,N2);
Mgc_tmp=0;Mp_tmp=zeros(1,8);
Hs_magn=zeros(1,58);
for m=2:N1-1
    for  n=2:N2-1 
           
          Mgc_tmp=sqrt(I_0_degree(m,n)*I_0_degree(m,n)+I_90_degree(m,n)*I_90_degree(m,n));
           
          Mp_tmp(1,1)=sqrt(I_0_degree(m,n+1)*I_0_degree(m,n+1)+I_90_degree(m,n+1)*I_90_degree(m,n+1));
          Mp_tmp(1,2)=sqrt(I_0_degree(m-1,n+1)*I_0_degree(m-1,n+1)+I_90_degree(m-1,n+1)*I_90_degree(m-1,n+1));
          Mp_tmp(1,3)=sqrt(I_0_degree(m-1,n)*I_0_degree(m-1,n)+I_90_degree(m-1,n)*I_90_degree(m-1,n));
          Mp_tmp(1,4)=sqrt(I_0_degree(m-1,n-1)*I_0_degree(m-1,n-1)+I_90_degree(m-1,n-1)*I_90_degree(m-1,n-1));
          Mp_tmp(1,5)=sqrt(I_0_degree(m,n-1)*I_0_degree(m,n-1)+I_90_degree(m,n-1)*I_90_degree(m,n-1));
          Mp_tmp(1,6)=sqrt(I_0_degree(m+1,n-1)*I_0_degree(m+1,n-1)+I_90_degree(m+1,n-1)*I_90_degree(m+1,n-1));
          Mp_tmp(1,7)=sqrt(I_0_degree(m+1,n)*I_0_degree(m+1,n)+I_90_degree(m+1,n)*I_90_degree(m+1,n));
          Mp_tmp(1,8)=sqrt(I_0_degree(m+1,n+1)*I_0_degree(m+1,n+1)+I_90_degree(m+1,n+1)*I_90_degree(m+1,n+1));          
          for p=1:8
              if(Mgc_tmp>=Mp_tmp(1,p))
              LP(m,n)=LP(m,n)+2^(8-p);
              end
          end
          
          index=LookupTable(LP(m,n));
         
             if(index~=-1)         
                 Hs_magn(index)=Hs_magn(index)+1; 
             end
    end
end

% Hs_magn=Hs_magn/(N1*N2);

% 8. Construct the binary patterns, and calculate their histogram



% 9. Combine the histograms calculated from steps 6 and 8.
HISTOGRAM=[Hs_magn Hs_1_2 Hs_1_3 Hs_1_4 Hs_2_1  Hs_2_3 Hs_2_4 Hs_3_1 Hs_3_2 Hs_3_4 Hs_4_1 Hs_4_2 Hs_4_3];
  
plot(HISTOGRAM);
% 10. Construct the feature vector.


%11. Return the feature vector.
