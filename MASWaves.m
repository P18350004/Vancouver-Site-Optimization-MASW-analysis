clear all
close all
clc

load c_curve0;  % Rayleigh wave phase velocity vector from experimental dispersion curves at Vancouver site
load lambda_curve0; % wavelength vector of dispersion curve
load f_curve0;  % frequency vector of disperison curve
%% Inversion
c_test_min = 50; % minimum phase velocity (m/s) 
c_test_max = 200; % maximum phase velocity (m/s)
delta_c_test = 5; 
c_test = c_test_min:delta_c_test:c_test_max; % m/s

% Layer parameters
n = 8; % number of soil layers
alpha =[400 400 400 400 400 400 400 400 400]; % P-wave velocity

h = [0.2	0.2	2.8	2.5	5.0	2.6	7.5	1.3	1.0]; %optimized thickness from TLBO  
 beta = [74.5	74.5	92.4	124.7	142.4	200.0	200.0	199.4	200.0]; % optimized Vs from  TLBO

rho = [ 2000 2000 2000 2000 2000 2000 2000 2000 2000]; % Density of soil layers (kg/m^3)

[c_t,lambda_t] = MASWaves_theoretical_dispersion_curve...
    (c_test,lambda_curve0,h,alpha,beta,rho,n);

FigWidth = 8; % cm
FigHeight = 10; % cm
FigFontSize = 12; % pt
f_curvet = f_curve0';
figure
MASWaves_plot_theor_exp_dispersion_curves(c_t,f_curvet,...
    c_curve0,f_curve0,FigWidth,FigHeight,FigFontSize)
e = MASWaves_misfit(c_t,c_curve0);



up_low_boundary = 'yes';
FigWidth = 16; % cm
FigHeight = 10; % cm
FigFontSize = 12; % pt
figure

MASWaves_plot_inversion_results_one_iteation(c_t,f_curvet,...
    c_curve0,f_curve0,n,beta,h,e,FigWidth,FigHeight,FigFontSize)

