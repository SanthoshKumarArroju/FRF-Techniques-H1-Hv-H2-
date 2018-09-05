clc; clear all; close all;
%% Frequency domain
load pseudorand_20avg_10hz.mat
figure()
f = Freq_domain;
plot(f, 20*log10(Hf_chan_2))
hold on
load pseudorand_200avg_10hz.mat
plot(f, 20*log10(Hf_chan_2))
legend('low avg','high avg')
title('FRF vs Freq')
xlabel('Frequency, Hz')
ylabel('FRF')

%% Time domain
% load pseudorand_20avg_10hz.mat
% figure()
% plot(Time_domain, Time_chan_2)
% hold on
% load pseudorand_200avg_10hz.mat
% plot(Time_domain, Time_chan_2)
% legend('low avg','high avg')
% title('Acceleration vs time')
% xlabel('Time, sec')
% ylabel('Acceleration, g')

%% low avg frf estimators

load pseudorand_20avg_10hz.mat

f = Freq_domain;
Sfx = Hf_Cross_Spec_chan_2; 
Sxf = conj(Sfx);                   
Sxx = PSD_chan_2;           
Sff = PSD_chan_1;        
H1 = (Sfx./Sff).';                          % H1 estimate
H2 = (Sxx./Sxf).';                          % H2 estimate
Hv = ((Sfx./abs(Sfx)).*(sqrt(Sxx./Sff)))';  % Hv estimate

figure()
plot(f,20*log10(abs(H1)))
hold on
plot(f,20*log10(abs(Hv)))
% hold on
plot(f,20*log10(abs(H2)))
title('FRF estimator for Low average')
legend('H1','Hv','H2')
xlabel('Frequency, Hz')
ylabel('FRF')


%% high avg frf estimators

load pseudorand_200avg_10hz.mat

f = Freq_domain;
Sfx = Hf_Cross_Spec_chan_2; 
Sxf = conj(Sfx);                   
Sxx = PSD_chan_2;           
Sff = PSD_chan_1;        
H1 = (Sfx./Sff).';                          % H1 estimate
H2 = (Sxx./Sxf).';                          % H2 estimate
Hv = ((Sfx./abs(Sfx)).*(sqrt(Sxx./Sff)))';  % Hv estimate

figure()
plot(f,20*log10(abs(H1)))
hold on
plot(f,20*log10(abs(Hv)))
% hold on
plot(f,20*log10(abs(H2)))
title('FRF estimator for High average')
legend('H1','Hv','H2')
xlabel('Frequency, Hz')
ylabel('FRF')
