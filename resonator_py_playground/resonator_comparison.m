
%Jonathan Hoh 11/14/2019

% load in s-params
param = sparameters('155new.s2p');
s21 = rfparam(param,2,1);
freq = param.Frequencies;

%load in shifted s-params
mod_param = sparameters('155mod.s2p');
mod_s21 = rfparam(mod_param,2,1);
mod_freq = mod_param.Frequencies;

%plot s21 and phase
rfplot(param,2,1,'angle')
hold on
rfplot(mod_param,2,1,'angle')
%rfplot(param)
%hold on
%rfplot(mod_param)


%find angle information
ang = unwrap(angle(s21))*180/pi;
mod_ang = unwrap(angle(mod_s21))*180/pi;

%turn s parameters into a magnitude
s_mag = 20*log10(abs(s21));
mod_s_mag = 20*log10(abs(mod_s21));

%find minimum value of s21 (resonance)
%requires vline.m file from the Matlab file share, comment out if needed
%as they only represent the resonance
[low,I] = min(s_mag);
resonance = freq(I);
[mod_low,mod_I] = min(mod_s_mag);
mod_resonance = mod_freq(mod_I);
%v1 = vline(resonance,'r');
%v2 = vline(mod_resonance,'g');
hold off

%find phi0 of phase at resonance
%requires hline.m file from the Matlab file share, comment out if needed
%as they only represent phi0
phi0 = ang(I);
mod_phi0 = mod_ang(mod_I);
error = abs(phi0-mod_phi0);
h1 = hline(phi0, 'r');
h2 = hline(mod_phi0, 'g');
%hold off

%Guess at linear slope from visual inspection
slope_guess = 7.2727e-05;
freq_to_phase_ratio = 13750;

%Now create a function that will try to find linear portion
%seems to occur around halfway (really 3/4) between max/min and resonance
%this (3/4) value may have to be tweaked depending on quality factor
%significantly higher quality factors may need lower values and vice-vera
[ang_M, I2] = max(ang);
[ang_m, I3] = min(ang);
half_min = round(I3+(I-I3)*(3/4));
half_max = round(I2-(I2-I)*(3/4));
lp_start = ang(half_min)*(180/pi);
lp_stop = ang(half_max)*(180/pi);
lf_start = freq(half_min);
lf_stop = freq(half_max);
slope = (lp_stop-lp_start)/(lf_stop-lf_start);

[mod_ang_M, mod_I2] = max(mod_ang);
[mod_ang_m, mod_I3] = min(mod_ang);
mod_half_min = round(mod_I3+(mod_I-mod_I3)*(3/4));
mod_half_max = round(mod_I2-(mod_I2-mod_I)*(3/4));
mod_lp_start = mod_ang(mod_half_min)*(180/pi);
mod_lp_stop = mod_ang(mod_half_max)*(180/pi);
mod_lf_start = mod_freq(mod_half_min);
mod_lf_stop = mod_freq(mod_half_max);
mod_slope = (mod_lp_stop-mod_lp_start)/(mod_lf_stop-mod_lf_start);

