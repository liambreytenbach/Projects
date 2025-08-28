% Robot Parameters
wheelR = 0.031; %Wheel radius (m)
axleLength = 0.136; %Distance between wheels (m)
ticksPerRot = 20; % Ticks per rotation for encoders
load wheelLUT %Look up table for platform motors
Ts = 0.01; %Sample time
maxV = (160/30)*pi*wheelR;
load wheelMotorModel %Motor model for platform motorswheelMotorModel

% Simulation Parameters
load map.mat;
xInitial = 1;
yInitial = 0.2;
thetaInitial = 90;

distanceSimulated = 1; % Distance variable used during simulation of location storage

% Transfer function
velTF = tf(wheelMotorModel);
integrator = tf(1, [1, -1], ts = -1, Variable = 'z^-1');
gain = (2*pi*wheelR)/ticksPerRot;
posTF = gain*velTF*integrator;

% Line Sensor Parameters
enviroVal = 1;
lineVal = 0;


% 90 DEGREE TURN -> 11 TICKS