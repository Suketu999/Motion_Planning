Path = [2,2];
for i=1:length(path)
    Path(end+1,:) = path(i,:);
end

bicycle = bicycleKinematics("VehicleInputs","VehicleSpeedHeadingRate","MaxSteeringAngle",pi/8);
waypoints = Path;
sampleTime = 0.05;               % Sample time [s]
vizRate = rateControl(30/sampleTime);
tVec = 0:sampleTime:20;          % Time array
initPose = [waypoints(1,:)'; 0]; % Initial pose (x y theta)
controller2 = controllerPurePursuit("Waypoints",waypoints,"DesiredLinearVelocity",3,"MaxAngularVelocity",3*pi);
goalPoints = waypoints(end,:)';
goalRadius = 1.5;
[tBicycle,bicyclePose] = ode45(@(t,y)derivative(bicycle,y,HelperMobileRobotController(controller2,y,goalPoints,goalRadius)),tVec,initPose);
bicycleTranslations = [bicyclePose(:,1:2) zeros(length(bicyclePose),1)];
bicycleRot = axang2quat([repmat([0 0 1],length(bicyclePose),1) bicyclePose(:,3)]);

% plot(waypoints(:,1),waypoints(:,2),"kx-","MarkerSize",20);
% hold all

for i=1:length(bicycleRot)
    show(map');
    hold on
    plotTransforms(bicycleTranslations(i,:),bicycleRot(i,:),'MeshFilePath','groundvehicle.stl',"MeshColor","b");
    view(2);
    hold off;
    xlim([1,50]);
    ylim([1,50]);
    title('A* Animation')
    waitfor(vizRate);
end