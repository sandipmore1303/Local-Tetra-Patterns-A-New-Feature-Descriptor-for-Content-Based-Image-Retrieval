
function LTrP_second_order_of_pixel= second_order_LTrP_of_pixel(m,n)
 global  I_1_direction
LTrP_second_order_of_pixel=zeros(1,8);


I_1_direction_of_8_neighbors_of_pixel_m_n=zeros(1,8);
I_1_direction_of_pixel_m_n=I_1_direction(m,n);

    
I_1_direction_of_8_neighbors_of_pixel_m_n(1)=I_1_direction(m,n+1);
I_1_direction_of_8_neighbors_of_pixel_m_n(2)=I_1_direction(m-1,n+1);
I_1_direction_of_8_neighbors_of_pixel_m_n(3)=I_1_direction(m-1,n);
I_1_direction_of_8_neighbors_of_pixel_m_n(4)=I_1_direction(m-1,n-1);
I_1_direction_of_8_neighbors_of_pixel_m_n(5)=I_1_direction(m,n-1);
I_1_direction_of_8_neighbors_of_pixel_m_n(6)=I_1_direction(m+1,n-1);
I_1_direction_of_8_neighbors_of_pixel_m_n(7)=I_1_direction(m+1,n);
I_1_direction_of_8_neighbors_of_pixel_m_n(8)=I_1_direction(m+1,n+1);

for i=1:8
 if(I_1_direction_of_8_neighbors_of_pixel_m_n(i)==I_1_direction_of_pixel_m_n)
     LTrP_second_order_of_pixel(i)=0;
 else
     LTrP_second_order_of_pixel(i)=I_1_direction_of_8_neighbors_of_pixel_m_n(i);
 end
 
 
 

end
