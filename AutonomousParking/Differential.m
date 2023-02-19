
% u=1;
% sz=size(Path);
% fpath(1,1)=2;
% fpath(1,2)=2;
% while u<=sz(1)
%     fpath(u,1)=Path(end+1-u,1);
%     fpath(u,2)=Path(end+1-u,2);
%     u=u+1;
% end
% 
% Path = fpath;

load('Path.mat');
robotInitialLocation = Path(1,:);
robotGoal = Path(end,:);
%%%%%
initialOrientation = 0;

robotCurrentPose = [robotInitialLocation initialOrientation]';

robot = differentialDriveKinematics("TrackWidth", 3, "VehicleInputs", "VehicleSpeedHeadingRate");

controller = controllerPurePursuit;

controller.Waypoints = Path;

controller.DesiredLinearVelocity = 0.6;

controller.MaxAngularVelocity = 2;

controller.LookaheadDistance = 0.3;

goalRadius = 0.8;
distanceToGoal = norm(robotInitialLocation - robotGoal);

% Initialize the simulation loop
sampleTime = 0.3;
vizRate = rateControl(30/sampleTime);

% Initialize the figure
figure

% Determine vehicle frame size to most closely represent vehicle with plotTransforms
frameSize = robot.TrackWidth/0.8;

while( distanceToGoal > goalRadius )
    
    % Compute the controller outputs, i.e., the inputs to the robot
    [v, omega] = controller(robotCurrentPose);
    
    % Get the robot's velocity using controller inputs
    vel = derivative(robot, robotCurrentPose, [v omega]);
    
    % Update the current pose
    robotCurrentPose = robotCurrentPose + vel*sampleTime; 
    
    % Re-compute the distance to the goal
    distanceToGoal = norm(robotCurrentPose(1:2) - robotGoal(:));
    
    % Update the plot
    hold off
    
    % Plot path each instance so that it stays persistent while robot mesh
    % moves
    plot(Path(:,1), Path(:,2),"k--d")
    show(map)
    hold all
    
    % Plot the path of the robot as a set of transforms
    plotTrVec = [robotCurrentPose(1:2); 0];
    plotRot = axang2quat([0 0 1 robotCurrentPose(3)]);
    plotTransforms(plotTrVec', plotRot, "MeshFilePath", "diffe.stl", "Parent", gca, "View","2D", "FrameSize", frameSize);
    light;
    title('Delivery Robot')
    xlim([0 25])
    ylim([0 25])
    
    waitfor(vizRate);
end