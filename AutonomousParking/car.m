diffDrive.WheelSpeedRange = [-10 10]*2*pi;
model = bicycleKinematics("VehicleInputs","VehicleSpeedHeadingRate","MaxSteeringAngle",pi/8);
load('Path.mat');
waypoints = Path;

% Define the total time and the sample rate
sampleTime = 0.05;               % Sample time [s]
tVec = 0:sampleTime:20;          % Time array

initPose = [waypoints(1,:)'; 0]; % Initial pose (x y theta)

controller2 = controllerPurePursuit("Waypoints",waypoints,"DesiredLinearVelocity",3,"MaxAngularVelocity",3*pi);
goalPoints = waypoints(end,:)';
goalRadius = 1;

[tModel,modelPose] = ode45(@(t,y)derivative(model,y,exampleHelperMobileRobotController(controller2,y,goalPoints,goalRadius)),tVec,initPose);

modelTranslations = [modelPose(:,1:2) zeros(length(modelPose),1)];
modelRot = axang2quat([repmat([0 0 1],length(modelPose),1) modelPose(:,3)]);
% 
% figure
% %plot(waypoints(:,1),waypoints(:,2),"kx-","MarkerSize",20);
% show(map)
% hold all
% plot(bicyclePose(:,1),bicyclePose(:,2))
% hold all
% title('The Car')

% sz=size(bicycleTranslations);
% k=1;
% 
% while k<=sz(1) 
%     plotTransforms(bicycleTranslations(k,:),bicycleRot(k,:),'MeshFilePath','groundvehicle.stl',"MeshColor","r");
%     waitfor(rateControl(30/sampleTime));
% end
% view(0,90)