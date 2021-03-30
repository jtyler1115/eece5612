clear all;
close all;
r = load('hwk6_1.mat');
step = 1/r.fs;
freqcarrier = 20*10^9;
for t = 1:length(r.v)
    r.t(t)=-step + step*t;
end

i = 1;
for fd = -10000:.1:10000
    f = r.v .* r.u .* exp(-j*2*pi*fd*r.t);
    int = trapz(f);
    integ(i) = abs(int);
    freq(i) = fd;
    i=i+1;
end
[argvalue, argmax] = max(integ);
freqdoppler = freq(argmax);
lambda = 3*(10^8)/freqcarrier;
velocity = freqdoppler * lambda;
figure()
plot(freq,integ)
xlabel('Doppler Frequency (Hz)')
ylabel('Fourier Transfform of v(t)u*(t)')
title('Maximum Likelihood Determination of Doppler Shift')
