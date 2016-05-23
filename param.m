%% parameter setting

%% Time slot number setting 
T=5 ;   %T:the number of time slot

%% radius distance and pico center setting
radius=500/sqrt(3);
num_pico=3;
atleast_dis=radius*1/3;
V=3;    % UE velocity
pico_centerx=radius/2*cos(pi/6);
pico_centery=radius/2*sin(pi/6);

%% UE number 
UE_max=5; % UE max number per pico



% cc_freq = [  881.5*1e6,  2132.5*1e6,  5260*1e6]; %licensed band freq
%% CC setting
cc_freq=[881.5*1e6];
num_CC=length(cc_freq);
pene_loss = 10;
num_PCC=length(cc_freq)-1;
num_SCC=num_CC-num_PCC;
Wo=180*10^3;    % RB:180 kHz
% Wo=5*180*10^3;    % RB:180 kHz

% RB setting
num_RBs=50; %original:50  % B=10M Hz
num_SCs = 12;

%% Power and energy setting
P_max=0.13; % 0.13(w)
P_max_overall=P_max*num_RBs;
% Pc=6.8; % circuit power: 6.8(w)
Pc=1;   % reference :(Must) SWIPT EE
E_HE_max=10^(27/10)/1000; % Maximum harvesting energy: 27(dbm),approximate:0.5(w)
E_B=5; % Maximum battery storage=5(w)
% P_UE=0.2; % Power consumption of UE: 0.2(w) !! need to be bigger: 4(W)
P_UE=0.1;   % reference :(Must) SWIPT EE;
P_efficiency=6.25;
H_efficiency=0.99;
P_Require=10^-7;

%% QoS setting
R_min=10^6; % 

%% other parameter need check!
% Interference=10^(-100/10)/1000;%dBm->linear     % need modify
% Interference=5*10^-9;
Interference=10^-9;
N_proc=10^(-125/10)/1000;   %reference: (Must) Energy-efficient power allocation
% N_proc=10^(-138/10)/1000;   %reference: 
% N_proc=10^-9;

%{
rrrr=250;
radius = 500/sqrt(3);  % 288.6751
atleast_dis = 35;
% atleast_dis = radius*1/3;
N = 15; %user 個數
num_pico = 3; %pico 個數
wifi_density = 0.001768;
Pj=0.222528;
V = 3; %macro 個數
Jmax=3;
%cc_freq = [740*1e6, 751*1e6, 881.5*1e6, 1842.5*1e6, 2132.5*1e6,  2140*1e6, 2665*1e6, 5260*1e6]; %licensed band freq
cc_freq = [  881.5*1e6,  2132.5*1e6,  5260*1e6]; %licensed band freq
%cc_freq = [ 751*1e6, 881.5*1e6,  5260*1e6,  5500*1e6];
c_wifi=87.6*1e6;
num_CC=length(cc_freq);
num_PCC=length(cc_freq)-1;
num_SCC=num_CC-num_PCC;
num_RBs = 100;
num_SCs = 12;
pene_loss = 10;
Pmax_pico=10^(24/10)/1000;%dBm->linear
Pmax_macro=10^(46/10)/1000;
Noise_power = -174;                     
UE_Noise_figure = 9;                                  
BW=180000;
Noise  = ((10^(Noise_power/10)*BW)/1000)*10^((UE_Noise_figure) /10);
QoS=3*10^6;
%Interference=10^(-100/10)/1000;%dBm->linear
%}