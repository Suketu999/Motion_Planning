function robotRefState = HelperMobileRobotController(purePursuitObj, robotPose, robotGoal, goalRadius)
% This function is for internal use only and may be removed in a future
% release.
%exampleHelperMobileRobotController Convert outputs of pure pursuit controller to a single output
%   This function accepts a pure pursuit controller object, PUREPURSUITOBJ,
%   and the current pose of the robot under control. The function combines
%   the two outputs of the controller into a single 2x1 ouput,
%   ROBOTREFSTATE. This allows the controller to be easily used with ode
%   solvers.

%   Copyright 2019 The MathWorks, Inc.

% Get controller output
controller = purePursuitObj;
[vRef, wRef] = controller(robotPose);

% Stop controller when goal is reached
distanceToGoal = norm(robotPose(1:2) - robotGoal(:));
if distanceToGoal < goalRadius
    vRef = 0;
    wRef = 0;
end

robotRefState = [vRef; wRef];
end

