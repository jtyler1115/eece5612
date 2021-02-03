clear all;
close all;
results={}
for SNR=0:15
    for N= 1:10000
        %generate noisy or noiseless signal
        z=randn;
        A = z + SNR;
        coin = rand;
        if coin < .7
            %present
            %y = A+z
            y = A + z;
            actual = 1;
        else
            %absent
            y = z;
            actual = 0;
        end
        output(N).actual=actual;
        
        %use ml to try to detect signal
        gamma = A/2;
        if y < gamma
            %detect absent
            detect = 0;
        else
            %detect present
            detect = 1;
        end
        output(N).detect=detect;
    end
    results{SNR+1}=output;
end


for SNR = 0:15
    numFA=0;
    for N = 1:length(results{SNR+1})
        if results{SNR+1}(N).detect==1 && results{SNR+1}(N).actual==0
            numFA = numFA + 1;
        end
    end
    pfa = numFA/length(results{SNR+1});
    probFalseAlarms(SNR+1,1)=SNR;
    probFalseAlarms(SNR+1,2)=pfa;
end

%find equation
%pfa = qfunc(sqrt(10^(x/10))/2)
x=linspace(0,15,1000)
y=qfunc(sqrt(10.^(x/20))/2)
figure()
scatter(probFalseAlarms(:,1),probFalseAlarms(:,2))
hold on;
plot(x,y)
xlabel('Signal/Noise Ratio (dB)')
ylabel('Probability of False Alarm')
title('Theoretical vs Actual Probability of False Alarm')
legend('Actual','Theoretical')
            