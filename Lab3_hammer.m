% Lab 3: Estimation of noise levels using H1, H2 and Hv estiamte
% Case 1: Impulse Hammer at location 6 on the wing

clear all
clc
load('test_3.mat')

F = Freq_domain;
SFX = Hf_Cross_Spec_chan_2; 
SXF = conj(SFX);                   
SXX = PSD_chan_2;           
SFF = PSD_chan_1;        
H1 = (SFX./SFF).';                          % H1 estimate
H2 = (SXX./SXF).';                          % H2 estimate
Hv = ((SFX./abs(SFX)).*(sqrt(SXX./SFF)))';  % Hv estimate

figure(1)
plot(F,20*log10(abs(H1)),'b')
hold on
plot(F,20*log10(abs(Hv)),'r')
hold on
plot(F,20*log10(abs(H2)),'k')
title('FRF of impact hammer test')
legend('H1','Hv','H2')
coh = H1/H2;   % 0.2123
coherence = abs(coh);

noise_op = (1-coh)*SXX;   % noise in output signal estimation
noise_ip = (1-coh)*SFF;  % noise in output signal estimation

figure(2)
plot(Freq_domain,noise_ip)
title('Estimation of error in i/p signal')

figure(3)
plot(Freq_domain,noise_op)
title('Estimation of error in o/p signal')

