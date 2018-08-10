% Lab 3: Estimation of noise levels using H1, H2 and Hv estiamte
% Case 2: Sine excitation at 13.5Hz

clear all
clc
load('sin_100hz.mat')

f = Freq_domain(1:200);
Sfx = Hf_Cross_Spec_chan_2(1:200); 
Sxf = conj(Sfx);                   
Sxx = PSD_chan_2(1:200);           
Sff = PSD_chan_1(1:200);        
H1 = (Sfx./Sff).';                          % H1 estimate
H2 = (Sxx./Sxf).';                          % H2 estimate
Hv = ((Sfx./abs(Sfx)).*(sqrt(Sxx./Sff)))';  % Hv estimate

figure(1)
plot(f,20*log10(abs(H1)),'b')
hold on
plot(f,20*log10(abs(Hv)),'r')
hold on
plot(f,20*log10(abs(H2)),'k')
title('FRF of sine excitation at 13.5Hz')
legend('H1','Hv','H2')
coh = H1/H2;   % 0.2429
coherence = abs(coh)

noise_op = (1-coh)*Sxx;   % noise in output signal estimation
noise_ip = (1-coh)*Sff;  % noise in output signal estimation

figure(2)
plot(Freq_domain(1:200),noise_ip)
title('Estimation of error in i/p signal')

figure(3)
plot(Freq_domain(1:200),noise_op)
title('Estimation of error in o/p signal')

