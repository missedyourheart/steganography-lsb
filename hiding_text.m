% Steganography with LSB
% Create by Umut on 2017

clc
clear
% image & text files
image=imread('image.bmp');
text=fileread('text.txt');
% text
ascii=uint8(text);
textBin=transpose(dec2bin(ascii,8));
textBin=textBin(:);
textLength=length(textBin);
newBin=zeros(textLength,1);
for h=1:textLength
    if(textBin(h) == '0')
        newBin(h)=0;
    else
        newBin(h)=1;
    end
end
% Image
newImage=image;
dimension1=size(image,1);
dimension2=size(image,2);
dimension3=size(image,3);
count=1;
if textLength<dimension1*dimension2*dimension3
for k=1:dimension3
    for j=1:dimension1
        for i=1:dimension2           
            if (count<=textLength)
                img=mod(image(j,i,k),2);
                if(img==newBin(count))
                    newImage(j,i,k)=image(j,i,k);
                else
                    if(img==0)
                        newImage(j,i,k)=image(j,i,k)+1;
                    else
                        newImage(j,i,k)=image(j,i,k)-1;
                    end
                end
            end
            count=count+1;                    
        end
    end
end
disp('success: text hidden')
% saving-files
imwrite(newImage,'C:\[your-file-path]\NewImage.bmp');
save('C:\[your-file-path]\TextLength.mat','textLength'); % for solving
else
    disp('error: text file bigger than image')
    disp('try again')
end %if



        
        


