clear all;
close all;
results={}

SNR0 = 10; %dB
SNR1 = 15; %dB
snr_lin0 = 10^(SNR0/10);
snr_lin1 = 10^(SNR1/10);
A0 = sqrt(snr_lin0);
A1 = sqrt(snr_lin1);
syms x;
f0 =  normpdf(x, A0, 1);
f1 =  normpdf(x, A1, 1);

idx = 1;
for PFA=0:10:100
    for N= 1:10000
        %generate noisy or noiseless signal
        
        z=randn;
        
        %A = z + SNR;
        coin = rand;
        if coin < .3
            %present
            %y = A+z
            y = A0 + z;
            actual = 0;
        else
            %absent
            y = A1 + z;
            actual = 1;
        end
        output(N).actual=actual;
        
        %use ml to try to detect signal
        gamma = 1*qfuncinv(.01*PFA)+ A0;
        if y < gamma
            %detect absent
            detect = 0;
        else
            %detect present
            detect = 1;
        end
        output(N).detect=detect;
    end
    results{idx}=output;
    idx = idx+1;
end


for idx = 1:11
     numFA=0;
     numZero=0;
     numCD=0;
     numOne=0;
     for N = 1:length(results{idx})
         if results{idx}(N).detect==1 && results{idx}(N).actual==0
             numFA = numFA + 1;
         end
         if results{idx}(N).detect==1 && results{idx}(N).actual==1
             numCD = numCD + 1;
         end
         if results{idx}(N).actual==0
             numZero = numZero + 1;
         end
         if results{idx}(N).actual==1
             numOne = numOne + 1;
         end
     end
     pfa = numFA/numZero;
     pcd = numCD/numOne;
     probFalseAlarms(idx,1)=(idx-1)*.1;
     probFalseAlarms(idx,2)=pfa;
     probFalseAlarms(idx,3)=numFA;
     probCorrectDetection(idx,1)=(idx-1)*.01;
     probCorrectDetection(idx,2)=pcd;
     probCorrectDetection(idx,3)=numCD;
end
% 
%find equation
%pfa = qfunc(sqrt(10^(x/10))/2)
%x=linspace(0,15,1000);
%y=qfunc(sqrt(10.^(x/20))/2)
%place=sqrt(10.^(x/10))/2
%y=.5*erfc(place/sqrt(2))
PFAstar = 0:.1:1;
pcdTheor = qfunc(qfuncinv(PFAstar)+A0-A1);
figure()
plot(probFalseAlarms(:,1),probFalseAlarms(:,2))
xlabel('Theoretical Probability of False Alarm')
ylabel('Experimental Probability of False Alarm')
title('Theoretical vs Experimental Probability of False Alarm')
figure()
scatter(probFalseAlarms(:,2),probCorrectDetection(:,2))
hold on
plot(PFAstar,pcdTheor)
xlabel('Maximum Probability of False Alarm (Pfa*)')
ylabel('Probability of Correct Detection')
title('Actual vs. Theoretical Receiver Operating Characteristics')
legend('Actual','Theoretical')
            