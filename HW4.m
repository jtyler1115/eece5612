clear all;
close all;
encrypted = load('hwk4.mat');
encMessage = encrypted(1).y;
delt = 2*pi/8;
for i = 1:8
    symbols(i)=exp(j*(i-1)*delt);
end

%Define Binary
binarySym = {'000' '001' '010' '011' '100' '101' '110' '111'};
figure()
plot(encMessage,'o')
title('Noisy, Encrypted Data')
xlabel('Real')
ylabel('Imaginary')
figure()
plot(symbols,'o')
title('8-PSK Symbols in the Complex Plane')
xlabel('Real')
ylabel('Imaginary')
for idx = 1:length(encMessage)
    sample = encMessage(idx);
    sampArray = sample.*ones(1,length(symbols));
    difference = abs(symbols - sampArray);
    [M,I] = min(difference);
    noNoise(idx) = symbols(I);
    noNoiseBinary(idx) = binarySym(I);
end
concatBinary = [noNoiseBinary{:}];
splitBinary = cellstr(reshape(concatBinary,5,[])');
numDecimal = int8(bin2dec(splitBinary));
numDecimal = numDecimal + int8(ones(length(numDecimal),1));
letters = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ';
message = letters(numDecimal)