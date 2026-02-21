clc;
close all;
clear all;

% --- Input Section ---
tmin = input('The lower bound of theta in degree=');
tmax = input('The upper bound of theta in degree=');
pmin = input('The lower bound of phi in degree=');
pmax = input('The upper bound of phi in degree=');

% --- Coordinate Setup ---
% Assign theta/phi and convert to radians
theta = (tmin:tmax) * (pi/180); 
phi = (pmin:pmax) * (pi/180);

% Assign differentials (step sizes)
dth = theta(2) - theta(1);
dph = phi(2) - phi(1);

% Create Meshgrid
[THETA, PHI] = meshgrid(theta, phi);

% --- Pattern Definition ---
% Note: The prompt asks for x as the field pattern and v as the power pattern
x = input('The field pattern : E(THETA,PHI)='); % Input: cos(THETA)
v = input('The power pattern: P(THETA,PHI)=', 's'); % Input: cos(THETA).^2

% --- Calculation ---
% Beam Area Calculation using Numerical Integration
% Prad = sum(sum( Pn * sin(theta) * dtheta * dphi ))
Pn = x.^2;
Prad = sum(sum(Pn .* sin(THETA) * dth * dph));

% --- Output Display ---
fprintf('\n Input Parameters: \n-------------------- ');
fprintf('\n Theta =%2.0f', tmin);
fprintf(' : %2.0f', dth*180/pi);
fprintf(' : %2.0f', tmax);
fprintf('\n Phi =%2.0f', pmin);
fprintf(' : %2.0f', dph*180/pi);
fprintf(' : %2.0f', pmax);
fprintf('\n POWER PATTERN : %s', v);

fprintf('\n \n Output Parameters: \n-------------------- ');
fprintf('\n BEAM AREA (steradians) = %3.2f\n', Prad);