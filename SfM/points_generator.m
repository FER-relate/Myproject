%3������ԓ��̑Ή��_���A�D���Ȍ������_���ɐ�������points.dat�ɏ������ށB

function points_generator()
%%%%%%%%%%%��������_�̌��̐ݒ�%%%%%%%%%%%
	n_p=100;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%x,y,z�͈̔͂��w�肵�āA���ꂼ��͈͓̔��̈�l�����𔭐�����B
	xmin=-300; %��������_�̂����W�͈̔͂��A(xmin,xmax)�Ƃ���
	xmax=300;
	ymin=-300;
	ymax=300;
	zmin=500;
	zmax=1000;
	
	for i=1:n_p
		k=rand(1);
		l=rand(1);
		m=rand(1);
		p=[xmin+(xmax-xmin)*k ymin+(ymax-ymin)*l zmin+(zmax-zmin)*m]
		fid=fopen('points.matrix','a');
		fprintf(fid,'%d %d %d\n',p);
		fclose(fid);
    end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	xrange=5000; %�_�̂����W�͈̔͂��A-xrange����{xrange�Ƃ���
%	yrange=5000;
%	zrange=5000;
%	for i=1:300;
%		k=rand(1)
%		l=rand(1)
%		m=rand(1)
%		p=[(2*k-1)*xrange (2*l-1)*yrange (2*m-1)*zrange]
%		fid=fopen('points.matrix','a');
%		fprintf(fid,'%d %d %d\n',p);
%		fclose(fid);
%	endfor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end

