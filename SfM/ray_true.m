%function [r_in_true,c,d_true,r_out_true] = ray_true(point)
function [r_in_true,c,d_true,r_out_true,psi_true] = ray_true(point)
%%--------�p�����[�^�̎擾----------
	load parameter.mat
%----------------------------------------%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 	X=point(1);
% 	Y=point(2);
% 	Z=point(3);
	
% 	t=Y/X;%tan(psi)

	
% 	[psi,xpsi]=cart2pol(X,Y);	%�ɍ��W�ɕϊ�
	

%%%%%%%%%�ȉ�z�������psi��]���������W�n�ōl���āA�Ō�ɂ��Ƃ̍��W�n�ɖ߂��C���[�W%%%%%%%%%

	c=fermat(point,n1,n2,n3,R,r,d);
	%theta1=atan2(c(1),rho1);
    point_at_glass_water = [c(1) c(2) sqrt(R*R-c(2)*c(2))];
    point_at_glass_air =[c(3) c(4) sqrt(r*r -c(4)*c(4))];
    r_in_true = [point_at_glass_air(1) point_at_glass_air(2) point_at_glass_air(3) - d];
    r_in_true = -r_in_true/norm(r_in_true);
    

%	r_in_true=[cos(theta1);0;sin(theta1)];		5/22
% 	r_in_true=[sin(theta1);0;cos(theta1)];

	%����͂܂���������ɉ�]���������W�n�ł̕\���B�m����=�P
% 	R=[cos(psi) -sin(psi) 0;sin(psi) cos(psi) 0;0 0 1];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% 	r_in_true=R*r_in_true;	%���Ƃ̂������W�n�ł̕\���ɖ߂����B�����XZ���W�n�ł̕\���ł�����B�m�������P

%%%%%%%%%%���łɌ��؂̂��߂�d_true�����߂�B%%%%%%%%%%
%	theta1=asin(r_in_true(3))
% 	theta2=asin(n1*r_in_true(3)/n2);
% 	theta3=asin(n1*r_in_true(3)/n3);
	
%	d_true=rho1_new*tan(theta1)+(rho2-rho1)*tan(theta2)-rho2_new*tan(theta3);%���ꂾ�ƃƂQ���g������C�X�l���g���Ă�

%	d_true=Z-(Z-c(2))*xpsi/(xpsi-rho2);				5/22
% 	d_true=Z-(Z-rho2)*xpsi/(xpsi-c(2));

%	d_true=c(2)-(Z-c(2))*rho2/(xpsi-rho2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%����Ɍ��؂̂��߂�r_out_true�����߂�.����́A���ܓ_����point�ւ̕����x�N�g���B�����ʂ�^�̊O�������x�N�g��%%%%%
%	r_out_true=point-([cos(psi);sin(psi);0]*rho2_new+[0;0;c(2)]);

%	r_out_true=point-[rho2_new*cos(psi);rho2_new*sin(psi);c(2)];%�ǂ���Ōv�Z���Ă��������ʂ������D		5/22
%	r_out_true=point-[c(2)*cos(psi);c(2)*sin(psi);rho2];
    r_out_true = [point_at_glass_water(1) - point(1) point_at_glass_water(2)-point(2) point_at_glass_water(3) - point(3)];
	r_out_true=r_out_true/norm(r_out_true);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%psi_true=psi;
	
	
	
end