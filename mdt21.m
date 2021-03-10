clear all;
close all;
image = load('mdt21.mat');
%imshow(image.y);
a = mean(image.y);

count = 0;

imageNew = zeros(1000,1000);


arrDim = 25;
f = (arrDim-1)/2;

%imaverage
imPadded = zeros(1000+2*f,1000+2*f);
for i = 1:length(imPadded)
    for j = 1:f
        imPadded(i,j) = 255;
    end
    for j = 1000+f:1000+2*f
        imPadded(i,j) = 255;
    end
end
for j = 1:length(imPadded)
    for i = 1:f
        imPadded(i,j) = 255;
    end
    for i = 1000+f:1000+2*f
        imPadded(i,j) = 255;
    end
end
for i=13:1012
    for j=13:1012
        imPadded(i,j)=image.y(i-12,j-12);
    end
end
figure()
imshow(imPadded)


for i = 1+f:1000+f
    for j = 1+f:1000+f
        arr=imPadded(i-f:i+f,j-f:j+f);
        newVal = mean(arr,'all');
        imageNew(i-f,j-f) = newVal;
    end
end
figure()
imshow(imageNew/255)
for i = 1:length(imageNew)
    for j = 1:length(imageNew)
        if imageNew(i,j) < 128
            imageNew(i,j) = 0;
        else
            imageNew(i,j) = 255;
        end
    end
end
figure()
imshow(imageNew/255)
