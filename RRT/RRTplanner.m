ss = stateSpaceSE2;
sv = validatorOccupancyMap(ss);
%load exampleMaps
map = occupancyMap(mapA,10);
sv.Map = map;
sv.ValidationDistance = 0.5;
ss.StateBounds = [map.XWorldLimits;map.YWorldLimits; [-pi pi]];
planner = plannerRRT(ss,sv);
planner.MaxConnectionDistance = 10;
start = [20,5,2];
goal = [160,5,2];
rng(100,'twister'); % for repeatable result
[pthObj,solnInfo] = plan(planner,start,goal);
show(map)
hold on
plot(solnInfo.TreeData(:,1),solnInfo.TreeData(:,2),'.-'); % tree expansion
plot(pthObj.States(:,1),pthObj.States(:,2),'r-','LineWidth',2) % draw path
title('Front View Path')
% ylim([0 93])
% ylabel('Pitch Angle (degrees)')

ss = stateSpaceSE2;
sv = validatorOccupancyMap(ss);
%load exampleMaps
map = occupancyMap(mapB,10);
sv.Map = map;
sv.ValidationDistance = 0.5;
ss.StateBounds = [map.XWorldLimits;map.YWorldLimits; [-pi pi]];
planner = plannerRRT(ss,sv);
planner.MaxConnectionDistance = 10;
start = [20,50,2];
goal = [160,50,2];
rng(100,'twister'); % for repeatable result
[pthObj,solnInfo] = plan(planner,start,goal);
show(map)
hold on
plot(solnInfo.TreeData(:,1),solnInfo.TreeData(:,2),'.-'); % tree expansion
plot(pthObj.States(:,1),pthObj.States(:,2),'r-','LineWidth',2) % draw path
title('Top View Path')
% % ylim([0 93])
% ylabel('Pitch Angle (degrees)')

ss = stateSpaceSE2;
sv = validatorOccupancyMap(ss);
%load exampleMaps
map = occupancyMap(mapD,10);
sv.Map = map;
sv.ValidationDistance = 0.5;
ss.StateBounds = [map.XWorldLimits;map.YWorldLimits; [-pi pi]];
planner = plannerRRT(ss,sv);
planner.MaxConnectionDistance = 10;
start = [20,2,2];
goal = [160,90,2];
rng(100,'twister'); % for repeatable result
[pthObj,solnInfo] = plan(planner,start,goal);
show(map)
hold on
plot(solnInfo.TreeData(:,1),solnInfo.TreeData(:,2),'.-'); % tree expansion
plot(pthObj.States(:,1),pthObj.States(:,2),'r-','LineWidth',2) % draw path
title('Orientation Path')
ylim([0 93])
ylabel('Roll Angle (degrees)')

ss = stateSpaceSE2;
sv = validatorOccupancyMap(ss);
map = occupancyMap(mapC,10);
sv.Map = map;
sv.ValidationDistance = 0.5;
ss.StateBounds = [map.XWorldLimits;map.YWorldLimits; [-pi pi]];
planner = plannerRRT(ss,sv);
planner.MaxConnectionDistance = 10;
start = [20,2,2];
goal = [160,90,2];
rng(100,'twister'); % for repeatable result
[pthObj,solnInfo] = plan(planner,start,goal);
show(map)
hold on
plot(solnInfo.TreeData(:,1),solnInfo.TreeData(:,2),'.-'); % tree expansion
plot(pthObj.States(:,1),pthObj.States(:,2),'r-','LineWidth',2) % draw path
title('Orientation Path')
ylim([0 93])
ylabel('Pitch Angle (degrees)')