clear; close all; clc

ss = load("stressStrain2.out");

time = 23;
step = int64(time/0.01);

figure
plot(ss(:,3),ss(:,2)/1e3)
xlabel('Strain')
ylabel('Stress [MPa]')


f = load("force.out");
d = load('deform.out');

figure
plot(d(:,3),f(:,3)/1e6)
xlabel('Curvature')
ylabel('Moment [kN·m]')
