prompt = 'Enter Grid Length:'; %of occupied cells in the grid
s = input(prompt);

size = s*s;

Tet_A = [1 1 1 1]'; %Verticle Block
occ_A = 1;

Tet_B = [1 1 1 1];  %Horizontal Block
occ_B = 1;

Tet_C = [1 1; 1 1]; %Square Block
occ_C = 1;

Tet_D = [1 1;0 1;0 1]; %eg2
occ_D = 4/6;

Tet_E = [1 0;1 1;0 1]; %eg3
occ_E = 4/6;

Tet_F = [0 1;1 1;0 1]; %eg4
occ_F = 4/6;

Tet_G = [0]; %blank
occ_G = 0;

prompt = 'Enter Occupancy from 0 to 1:'; %of occupied cells in the grid
occ_Eff = input(prompt);

syms x y z
assume(x,'integer')
assumeAlso(x >= 0) %to make the grid a bit more intereting
assume(y,'integer')
if occ_Eff >= 0.1 && occ_Eff <= 0.9
    assumeAlso(y >= 3) %to make the grid a bit more intereting
end
assume(z,'integer')
assumeAlso(z >= 0)

LHS = floor(occ_Eff*size);
diff = mod(LHS,4);
LHS = LHS - diff;

eqn1 = LHS == (x*occ_A*4 + y*occ_D*6 + z*occ_G);
eqn2 = size == 4*x + 6*y + z;
sol = solve([eqn1 eqn2],[x y z]);
x = sol.x;
y = sol.y;
z = sol.z;
x(1);
y(1);
z(1);

a = floor(x(1)/3);
b = floor(x(1)/3);
c = floor(x(1)/3);
d = floor(y(1)/3);
e = floor(y(1)/3);
f = floor(y(1)/3);
g = z(1);

T = [a 3 0; b 0 3; c 1 1; d 2 1; e 2 1; f 2 1; g 0 0];

OCPD = zeros(s,s);

i = 1; %varies from 1-number of a particular type of block
j = 1; %varies from 1-7 // index of block type

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,3)+1), cord(1,2)+1:(cord(1,2)+T(j,2)+1))=Tet_A;
    i=i+1;
end
i = 1;
j=j+1;

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,3)+1), cord(1,2)+1:(cord(1,2)+T(j,2)+1))=Tet_B;
    i=i+1;
end
i = 1;
j=j+1;

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,3)+1), cord(1,2)+1:(cord(1,2)+T(j,2)+1))=Tet_C;
    i=i+1;
end
i = 1;
j=j+1;

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,2)+1), cord(1,2)+1:(cord(1,2)+T(j,3)+1))=Tet_D;
    i=i+1;
end
i = 1;
j=j+1;

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,2)+1), cord(1,2)+1:(cord(1,2)+T(j,3)+1))=Tet_E;
    i=i+1;
end
i = 1;
j=j+1;

while (i<=T(j,1))
    cord = floor(s*rand(1,2));
    OCPD(cord(1,1)+1:(cord(1,1)+T(j,2)+1), cord(1,2)+1:(cord(1,2)+T(j,3)+1))=Tet_F;
    i=i+1;
end

r = s+2;                          % Get the matrix size
c = s+2;

show(binaryOccupancyMap(OCPD))

% prm = mobileRobotPRM(binaryOccupancyMap(OCPD),500)
% show(prm)