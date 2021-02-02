%{
    Author: Daniel Eduardo Rosas
    Date: 1/28/2021
    Description: THe following program calculates the resonance frequency 
    of a metamaterial and its absorption coefficient through estiimation 
    formulas.
%}

%% Constants  
c = 343; % speed of sound in dry air at 20 °C (m/s^2)

%% Geometry of the metamaterial
r_0 = 4e-3; % radius of central perforation
r_outer = 50e-3; % outer radius of absorber
d_p = 1e-3; % plate thickness
d_c = 1e-3; % width of lateral cavity (distance between the plates)
length = 31e-3; % absorber thickness

%% Properties of air at 1 atm pressure
% these arrays have the values corresponding from 10 to 30 degrees
temp = [5, 10, 15, 20, 25, 30]; % air tempratur C°
rho_0 = [1.269, 1.246, 1.225, 1.204, 1.184, 1.164]; % denisity of air kg/m^3
eta = [1.754e-5, 1.778e-5, 1.802e-5, 1.825e-5, 1.849e-5, 1.872e-5]; % dynamic viscosity kg/m*s
n_pr = [0.7350, 0.7336, 0.7323, 0.7309, 0.7296, 0.7282];

%% Derived quantities
phi_p = (r_0/r_outer)^2; % surface porosity of the absorber
phi_w = d_c/(d_c + d_p); % porosity of the main perforation wall
f_0 = c/(4*length); % quarter wavelength resonance frequency of air slab of thickness L (length)
f_bp = (8*eta(4))/(pi*(rho_0(4))^2); 
gamma = 0.97; % adiabatic constant (needs to be verified yet)

%% Estimation Formulas
f_r = f_0*sqrt(phi_p/phi_w)*(1-(1/4)*sqrt((f_bp/2*f_0)*...
    (sqrt(phi_w/phi_p)))*(1+((gamma-1)/sqrt(n_pr(4)))*(r_0/d_c)))

n = pi*(1-(f_r/f_0)*sqrt(phi_w/phi_p));

alpha_r = (4*sqrt(phi_w*phi_p)*(1-exp(-2*n)))/...
          ((sqrt(phi_w*phi_p)+1)-exp(-n)*(1-sqrt(phi_w*phi_p)))^2



