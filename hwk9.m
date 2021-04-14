clear all;
close all;
samples = load('hwk9.mat');

Y = samples.y;
a0 = .9;
a1 = .27;
a = 1;

n = 0:35;
m = a0 + a1*n;

%n=0
delty(1) = Y(1)-m(1);

for i = 2:36
    delty(i) = a*delty(i-1);
end

Ymodel = m(1:36)+delty;
figure()
plot(Ymodel)
hold on
plot(Y(1:36))
legend('Prediction','Actual')

delty36(1)=Y(25)-m(25);
for i = 2:12
    delty36(i) = a*delty36(i-1);
end
Ymodel36 = m(25:36)+delty36;

figure()
plot(Ymodel36)
hold on;
plot(Y(25:36))
legend('Prediction','Actual')


%Part 2
u = .01;
Ylms = samples.y;
Y_hat(1) = 0;
c(1) = u;
for i = 2:36
    theta(i)= (Ylms(i-1)-conj(Y_hat(i-1)));
    c(i) = c(i-1) + u*(Ylms(i-1))*theta(i);
    Y_hat(i) = conj(c(i-1)*Ylms(i-1));
end

figure()
plot(Y_hat)
hold on
plot(Ymodel)
hold on
plot(Ylms)
legend('LMS Prediction','Part A Model', 'Actual')
xlabel('Time (Months)');
ylabel('Value');
title('Comparison of Models');

