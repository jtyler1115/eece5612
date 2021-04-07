clear all;
close all;
door1 = load('door1.mat');
door2 = load('door2.mat');
door3 = load('door3.mat');
door4 = load('door4.mat');
door5 = load('door5.mat');
door6 = load('door6.mat');
door7 = load('door7.mat');
door8 = load('door8.mat');
door9 = load('door9.mat');
door10 = load('door10.mat');

door1.time = getTime(door1);
door2.time = getTime(door2);
door3.time = getTime(door3);
door4.time = getTime(door4);
door5.time = getTime(door5);
door6.time = getTime(door6);
door7.time = getTime(door7);
door8.time = getTime(door8);
door9.time = getTime(door9);
door10.time = getTime(door10);

figure()
plot(door1.time,door1.y);
title('Door 1')
xlabel('Sample Number','interpreter','latex')
ylabel('Time Between Arrivals (minutes)', 'interpreter', 'latex')

figure()
aveTime1 = getAveTime(door1.y);
plot(door1.time,aveTime1)
title('Door 1')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average value of $\lambda$', 'interpreter', 'latex')

figure()

subplot(4,3,1)
plot(door1.time,door1.y);
title('Door 1')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,2)
plot(door2.time,door2.y);
title('Door 2')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,3)
plot(door3.time,door3.y);
title('Door 3')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,4)
plot(door4.time,door4.y);
title('Door 4')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,5)
plot(door5.time,door5.y);
title('Door 5')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,6)
plot(door6.time,door6.y);
title('Door 6')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,7)
plot(door7.time,door7.y);
title('Door 7')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,8)
plot(door8.time,door8.y);
title('Door 8')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,9)
plot(door9.time,door9.y);
title('Door 9')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

subplot(4,3,11)
plot(door10.time,door10.y);
title('Door 10')
xlabel('Sample Number','interpreter','latex')
ylabel('Time (min)', 'interpreter', 'latex')

sgtitle('Comparison of Time Between Arrivals')

figure()
subplot(4,3,1)

plot(door1.time,aveTime1)
title('Door 1')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,2)
aveTime2 = getAveTime(door2.y);
plot(door2.time, aveTime2)
title('Door 2')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,3)
aveTime3 = getAveTime(door3.y);
plot(door3.time,aveTime3)
title('Door 3')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,4)
aveTime4 = getAveTime(door4.y);
plot(door4.time,aveTime4)
title('Door 4')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,5)
aveTime5 = getAveTime(door5.y);
plot(door5.time,aveTime5)
title('Door 5')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,6)
aveTime6 = getAveTime(door6.y);
plot(door6.time,aveTime6)
title('Door 6')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,7)
aveTime7 = getAveTime(door7.y);
plot(door7.time,aveTime7)
title('Door 7')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,8)
aveTime8 = getAveTime(door8.y);
plot(door8.time,aveTime8)
title('Door 8')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,9)
aveTime9 = getAveTime(door9.y);
plot(door9.time,aveTime9)
title('Door 9')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

subplot(4,3,11)
aveTime10 = getAveTime(door10.y);
plot(door10.time,aveTime10)
title('Door 10')
xlabel('Time(minutes)','interpreter','latex')
ylabel('Average $\lambda$', 'interpreter', 'latex')

sgtitle('Comparison of Average Arrival Rate Over Time')
