clear
clc

mic_1_freq_press = [dlmread('Mic_1_graph.txt')]; 
mic_2_freq_press = [dlmread('Mic_2_graph.txt')];
mic_3_freq_press = [dlmread('Mic_3_graph.txt')];

figure (1);
plot(mic_1_freq_press(:,1), mic_1_freq_press(:,2)), grid on, 
, xlabel('Frequency (Hz)'), ylabel('Sound Pressure(dB) at Micro 1')

figure (2);
plot(mic_2_freq_press(:,1), mic_2_freq_press(:,2)), grid on, 
, xlabel('Frequency (Hz)'), ylabel('Sound Pressure(dB) at Micro 2')

figure (3);
plot(mic_3_freq_press(:,1), mic_3_freq_press(:,2)), grid on, 
, xlabel('Frequency (Hz)')z, ylabel('Sound Pressure(dB) at Micro 3')