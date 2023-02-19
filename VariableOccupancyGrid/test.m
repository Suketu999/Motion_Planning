occ_Eff = 0.1
r = 130;                          % Get the matrix size
c = 129;imagesc((1:c)+1, (1:r)+1, Grid(occ_Eff));          % Plot the image
colormap(gray);                              % Use a gray colormap
axis equal                                   % Make axes grid sizes equal
title(['Occupancy =' num2str(occ_Eff)])
set(gca), 'Color', 'k';