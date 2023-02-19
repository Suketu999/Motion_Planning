A = zeros(25);
A(19:24,22:24) = 1;
A(1:6,22:24) = 1;
A(10:19,6:15) = 1;
A(1:25,25) = 1;
A(1:25,1) = 1;
A(1,1:25) = 1;
A(25,1:25) = 1;

A=A';
map = binaryOccupancyMap(A);
show(map);
%%surf(A);