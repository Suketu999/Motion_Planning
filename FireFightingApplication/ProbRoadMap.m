
startLocation = [2,2];
endLocation = [20,17];

map=binaryOccupancyMap(OCPD);
% show(map)

% mapInflated = copy(map);
% inflate(mapInflated,0.01);

prm = mobileRobotPRM(map,500);
path = findpath(prm, startLocation, endLocation);

% show(prm)
% plot(path(:,1),path(:,2))
% xlim([1,50])
% ylim([1,50])
% show(binaryOccupancyMap(OCPD));
% hold on

% bicycle = bicycleKinematics("VehicleInputs","VehicleSpeedHeadingRate","MaxSteeringAngle",pi/8);
% waypoints = path;
% sampleTime = 0.05;               % Sample time [s]
% vizRate = rateControl(30/sampleTime);
% tVec = 0:sampleTime:20;          % Time array
% initPose = [waypoints(1,:)'; 0]; % Initial pose (x y theta)
% controller2 = controllerPurePursuit("Waypoints",waypoints,"DesiredLinearVelocity",3,"MaxAngularVelocity",3*pi);
% goalPoints = waypoints(end,:)';
% goalRadius = 1.5;
% [tBicycle,bicyclePose] = ode45(@(t,y)derivative(bicycle,y,HelperMobileRobotController(controller2,y,goalPoints,goalRadius)),tVec,initPose);
% bicycleTranslations = [bicyclePose(:,1:2) zeros(length(bicyclePose),1)];
% bicycleRot = axang2quat([repmat([0 0 1],length(bicyclePose),1) bicyclePose(:,3)]);
% 
% % plot(waypoints(:,1),waypoints(:,2),"kx-","MarkerSize",20);
% % hold all
% 
% for i=1:400
%     show(map');
%     hold on
%     plotTransforms(bicycleTranslations(i,:),bicycleRot(i,:),'MeshFilePath','groundvehicle.stl',"MeshColor","b");
%     view(2);
%     hold off;
%     xlim([1,50]);
%     ylim([1,50]);
%     title('A* Animation')
%     waitfor(vizRate);
% end

% plot(path(:,1),path(:,2));