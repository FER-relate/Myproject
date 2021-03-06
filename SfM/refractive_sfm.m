% parameters %
n1 = 1.000; % air
n2 = 1.49; % glass
n3 = 1.333; % water
pixel_length = 0.0036;
R = 50/pixel_length; % R 50mm
r = 46/pixel_length; % r 46mm
d = 40/pixel_length; % distance between optical center and axis
f= 3.5/pixel_length; % pixel
axis_center = [0,0,0];
focal_center = [0,0,d-f];
v = 30;
u = 40;
d1 = d -f;
s = (sqrt(f*f*d1*d1-(v*v + f*f)*(d1*d1-r*r))-f*d1)/(v*v+f*f);
r_in = [s*u,s*v,s*f];
r_in_norm = norm(r_in);
N = [0,s*v,s*f+d1];
N_norm = norm(N);
theta_1 = atan(sqrt(u*u+v*v)/f);
r_glass = n1/n2*r_in_norm - (n1/n2*cos(theta_1)-sqrt(1- n1*n1/(n2*n2)*sin(theta_1)*sin(theta_1)))*N_norm;
r_glass_norm = norm(r_glass);
theta_2 = asin(n1*sin(theta_1)/n2);
r_out = n2/n3*r_glass_norm - (n2/n3*cos(theta_2)-sqrt(1- n2*n2/(n3*n3)*sin(theta_2)*sin(theta_2)))*N_norm;
theta_3 = asin(n2*sin(theta_2)/n3);
r_out_mov = [0,0, R- (R-r)*tan(theta_2)*tan(theta_3)-(r-d1)*tan(theta_1)*tan(theta_3)];
