clear all;
close all;
r = load('hwk6.mat');
for tao = 0:length(r.v)-length(r.g)
    f = r.v(1+tao:tao+length(r.g)).*r.g;
    int = trapz(f);
    result(tao+1) = int;
end
[argvalue, argmax] = max(result);
figure()
plot(result)
xlabel('Sample Number')
ylabel('$$R_{rs}\tau$$','interpreter','latex')
title('Maximum Likelihood Determination of Time Delay')
delay = (argmax-1) * 1/50;