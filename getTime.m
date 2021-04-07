function [time] = getTime(x)
    time(1) = 0;
    for i= 2:length(x.y)
        time(i) = time(i-1) + x.y(i);
    end