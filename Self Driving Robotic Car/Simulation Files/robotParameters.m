%Robot Parameters
wheelR = 0.031; %Wheel radius (m)
axleLength = 0.136; %Distance between wheels (m)
ticksPerRot = 20; % Ticks per rotation for encoders
load wheelLUT %Look up table for platform motors
Ts = 0.01; %Sample time
maxV = (160/30)*pi*wheelR;
load wheelMotorModel %Motor model for platform motorswheelMotorModel
load hardcore_challenging_maze.mat

lineSenPosition = [[0.0643 0.0353], [0.0675 0.005], [0.0643 -0.0353], [0.0675,-0.005]];

velTF = tf(wheelMotorModel);
integrator = tf(1, [1, -1], ts = -1, Variable = 'z^-1');
gain = (2*pi*wheelR)/ticksPerRot;
posTF = gain*velTF*integrator;

xInitial = 1.2431;
yInitial = 3.095;
thetaInitial = 90;

distanceSimulated = 1; % Distance variable used during simulation of location storage