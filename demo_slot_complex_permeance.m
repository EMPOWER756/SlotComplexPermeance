%% Demo: slotted air-gap complex relative permeance
clear; clc; close all;

%% Input variables
Rs = 130e-3;      % Stator-side radius [m]
Rm = 131.2e-3;    % Opposite air-gap radius [m]
b0 = 3.6e-3;      % Slot opening width [m]
Qa = 120;         % Number of slots [-]

%% Calculation
model = SlotComplexPermeance(Rs, Rm, b0, Qa);
result = model.calculate();

%% Plot
figure('Color','w','Position',[100 100 900 750]);
subplot(3,1,1);
plot(result.theta_deg,result.lambda_a,'LineWidth',1.6);
grid on;
ylabel('\lambda_a');
title('Real Part of Complex Relative Permeance');
subplot(3,1,2);
plot(result.theta_deg,result.lambda_b,'LineWidth',1.6);
grid on;
ylabel('\lambda_b');
title('Imaginary Part of Complex Relative Permeance');
subplot(3,1,3);
plot(result.theta_deg,result.lambda_mag,'LineWidth',1.6);
grid on;
xlabel('\theta (deg)');
ylabel('|\lambda|');
title('Magnitude of Complex Relative Permeance');
movegui('center');
