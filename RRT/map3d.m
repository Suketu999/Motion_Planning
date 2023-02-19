bin3 = occupancyMap3D(1);
pose = [ 0 0 0 1 0 0 0];

A = (0:1:175)';
B = repmat(1,176,1);
C = repmat(1,101,1);
D = (0:1:100)';

p1 = [A,B,B];
p2 = [A,100*B,B];
p3 = [A,B,100*B];
p4 = [A,100*B,100*B];
p5 = [C,D,C];
p6 = [C,D,100*C];
p7 = [100*C,D,100*C];
p8 = [175*C,D,100*C];
p9 = [100*C,D,C];
p10 = [175*C,D,C];

p6 = [p6;p7;p8;p9;p10];
% p1 = [(1:175)', 1:1, 1:1];
% p2 = [(1:175)',100,1];
% p3 = [(1:175),1,100];
% p4 = [(1:175),1,100];

maxRange = 175;

insertPointCloud(bin3,pose,p1,maxRange)
insertPointCloud(bin3,pose,p2,maxRange)
insertPointCloud(bin3,pose,p3,maxRange)
insertPointCloud(bin3,pose,p4,maxRange)
insertPointCloud(bin3,pose,p5,maxRange)
insertPointCloud(bin3,pose,p6,maxRange)
insertPointCloud(bin3,pose,pts,maxRange)

show(bin3)

