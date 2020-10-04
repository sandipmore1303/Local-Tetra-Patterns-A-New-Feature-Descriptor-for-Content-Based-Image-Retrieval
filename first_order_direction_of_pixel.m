function I_1_direction_of_pixel= first_order_direction_of_pixel(m,n)
global I;
I_0_degree_1st_order_of_center_pixel=I(m,n+1)-I(m,n);
I_90_degree_1st_order_of_center_pixel=I(m-1,n)-I(m,n);

% the direction of the center pixel can be calculated as
I_1_direction_of_pixel=0;
if(I_0_degree_1st_order_of_center_pixel>=0 && I_90_degree_1st_order_of_center_pixel>=0)
I_1_direction_of_pixel=1;
end

if(I_0_degree_1st_order_of_center_pixel<0 && I_90_degree_1st_order_of_center_pixel>=0)
I_1_direction_of_pixel=2;
end

if(I_0_degree_1st_order_of_center_pixel<0 && I_90_degree_1st_order_of_center_pixel<0)
I_1_direction_of_pixel=3;
end

if(I_0_degree_1st_order_of_center_pixel>=0 && I_90_degree_1st_order_of_center_pixel<0)
I_1_direction_of_pixel=4;
end

