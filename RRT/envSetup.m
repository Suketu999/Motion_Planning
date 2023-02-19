A(1:100,1)=1;
A(1,1:125)=1;
A(100,1:125)=1;
A(1:73,125)=1;
A(88:100,125)=1;
A(1:12,100)=1;
A(27:100,100)=1;
A(1:100,126:175)=0;
% surf(A)
% view(2)s
mapA = occupancyMap(A);
inflate(mapA,2);
show(mapA)
title('Front View')

B(1:100,1)=1;
B(1,1:125)=1;
B(100,1:125)=1;
B(1:43,100)=1;
B(58:100,100)=1;
B(1:43,125)=1;
B(58:100,125)=1;
B(1:100,126:175)=0;
figure
mapB = occupancyMap(B);
inflate(mapB,2);
show(mapB)
ylabel('Z [meters]');
title('Top View')

C(1:100,1:175)=0;
C(1:97,20)=1;
C(1:9,160)=1;
C(12:100,160)=1;
figure
mapC = occupancyMap(C);
show(mapC)
ylabel('Roll Angle (degrees)');
title('Orientation');
ylim([0 93])

D(1:100,1:175)=0;
D(1:97,160)=1;
D(1:9,20)=1;
D(12:100,20)=1;
figure
mapD = occupancyMap(D);
show(mapD)
ylabel('Pitch Angle (degrees)');
title('Orientation');
ylim([0 93])