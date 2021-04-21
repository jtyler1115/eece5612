clear all;
close all;
samples = load('fnl21.mat');
N(1) = 10;

Imax = 6;
q = .1;
p = .8;
n0 = 3;
pop=10000000

%This model shows number affected at the beginning of the week
for i = 2:52
    expected=round(Imax/2);
    if i > n0 
        N(i) = N(i-1)*(1-p)*(1-q)*expected;
    else
        N(i) = N(i-1)*(1-q)*expected;
    end
end

figure()
plot(N)
title('Augmented Model')
xlabel('Time (weeks)')
ylabel('Infected Persons')

yactual=samples.y;
Y_hat(1) = yactual(1);
u=.4/(pop^2);
c(1) = u;
for i = 2:36
    theta(i)= (yactual(i-1)-conj(Y_hat(i-1)));
    c(i) = c(i-1) + u*(yactual(i-1))*theta(i);
    Y_hat(i) = conj(c(i-1)*yactual(i-1));
end 

figure()
plot(Y_hat)
hold on;
plot(yactual)
title('Least Mean Squared Model')
xlabel('Time (weeks)')
ylabel('Infected Persons')
legend('Predicted Infections','Actual Infections', 'location','northwest')