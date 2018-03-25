clc;
%uv = [30 40];
%[r_in, r_out, d] = ray_in_out_pixel(uv);
% first, use generated 3D points to get correct 2D image points(ray_true)
% second, use R and t set to get rotated and moved 3D points and 2D image points
% third, R_t_estimator_pixel to get estimated R and t
% fourth, use R t estimated to get estimated 3D points
load points.mat;
load camera_motion.mat;
R_base = [1 0 0; 0 1 0;0 0 1];
t_base = [0; 0 ;0];
check = 0;
image_point0 = point3d_t_2d(points, R_base, t_base);
image_point1 = point3d_t_2d(points, Rotate, translation);
[image1_new, image2_new] = delete_outlier(image_point0, image_point1);
[R_est,t_est,ray1_vector,ray2_vector]=R_t_estimator_pixel(image1_new,image2_new,check)