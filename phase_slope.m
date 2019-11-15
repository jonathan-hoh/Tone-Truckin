%Jonathan Hoh 11/14/2019
% load in s-params
param = sparameters('YOUR S2P FILE HERE');
s21 = rfparam(param,2,1);
freq = param.Frequencies;

%plot s21 and phase
%rfplot(param,2,1,'angle')
%rfplot(param)

%find angle information
ang = unwrap(angle(s21));

%turn s parameters into a magnitude
s_mag = 20*log10(abs(s21));

%find minimum value of s21 (resonance)
[low,I] = min(s_mag);
resonance = freq(I);

%find phi0 of phase at resonance
phi0 = ang(I)*180/pi;

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
