clear
clc

L = 0.06233316;
s = 0.0216154;

c = 340;

freq_press_mic_1 = [dlmread('3D_mic_1_sound_pressure.txt')];

freq_press_mic_2 = [dlmread('3D_mic_2_sound_pressure.txt')];

freq_press_mic_3 = [dlmread('3D_mic_3_sound_pressure.txt')]; 

h_12 = (freq_press_mic_1(:,2) + i*freq_press_mic_1(:,3)) ./ (freq_press_mic_2(:,2) + i*freq_press_mic_2(:,3));


k = 2*pi* freq_press_mic_1/ c;

r = ((h_12 - exp(-i*s*k)) ./ (-h_12 + exp(i*s*k))) .* (exp(i*2*(L+s)*k));

a = 1 - abs(r).^2;

plot(freq_press_mic_1(:,1), a(:,1)), grid on, xlabel('Frequency (Hz)'), ylabel('Absorption Coefficient')
