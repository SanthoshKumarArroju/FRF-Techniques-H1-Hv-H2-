% Lab 3: Estimation of noise levels using H1, H2 and Hv estiamte
% Case 1: Impulse Hammer at location 6 on the wing

clear all
clc
load('test_3.mat')

f = Freq_domain;
Sfx = Hf_Cross_Spec_chan_2; 
Sxf = conj(Sfx);                   
Sxx = PSD_chan_2;           
Sff = PSD_chan_1;        
H1 = (Sfx./Sff).';                          % H1 estimate
H2 = (Sxx./Sxf).';                          % H2 estimate
Hv = ((Sfx./abs(Sfx)).*(sqrt(Sxx./Sff)))';  % Hv estimate

figure(1)
plot(f,20*log10(abs(H1)),'b')
hold on
plot(f,20*log10(abs(Hv)),'r')
hold on
plot(f,20*log10(abs(H2)),'k')
title('FRF of impact hammer test')
legend('H1','Hv','H2')
coh = H1/H2;   % 0.2123
coherence = abs(coh)

noise_op = (1-coh)*Sxx;   % noise in output signal estimation
noise_ip = (1-coh)*Sff;  % noise in output signal estimation

figure(2)
plot(Freq_domain,noise_ip)
title('Estimation of error in i/p signal')

figure(3)
plot(Freq_domain,noise_op)
title('Estimation of error in o/p signal')

