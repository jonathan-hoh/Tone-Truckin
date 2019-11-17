param = sparameters('yummy155.S2P');
%s21 = rfparam(S,2,1);
%ang = angle(s21);
%freq = param.Frequencies;
%plot(freq,angle)
%pha_s21 = angle(s21)*180/pi;
rfplot(param,2,1,'angle')
%rfplot(param)
%ang = param.angle