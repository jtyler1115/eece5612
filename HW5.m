clear all;
close all;
observations = load('hwk5.mat');

%Constants
M = 16;
doverlambda = .5;
theta = 20;
sigmaz1 = 1;
sigmaz = sqrt(sigmaz1/(2*M));
gamma = (sigmaz)*qfuncinv(.1);
phi = 2*pi*(doverlambda)*sind(theta);

for idx = 1:16
    s(idx,1)=exp(-j*(idx-1)*phi);
end
% for idx = 1:length(observations.thousand_vectors_y)
%     y = observations.thousand_vectors_y(:,idx);
%     stat = (1/M)*real(s'*y);
%     if stat >= gamma
%         decision = 1;
%     else
%         decision = 0;
%     end
%     observations.stat(idx) = stat;
%     observations.decision(idx) = decision;
% end

stat = (1/M)*real(s'*observations.thousand_vectors_y);
for idx = 1:length(stat)
    if stat(idx) >= gamma
        decision = 1;
    else
        decision = 0;
    end
    observations.decision(idx) = decision;
end

numdetections = sum(observations.decision)
numMissed = 8- sum(observations.decision([148,607,624,626,645,711,727,780]))
observations.decision([148,607,624,626,645,711,727,780])

figure()
plot(s,'o')
title('Circular Keys')
xlabel('Real')
ylabel('Imaginary')

