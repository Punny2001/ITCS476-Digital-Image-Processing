% pic = imread('/Users/punny/Desktop/Digital Image Processing/Images-20220815/dance.bmp');
% imshow(pic);
% size(pic)
% 
% pic45 = imrotate(pic,45);
% imshow(pic45);
% 
% pic1 = imcrop(pic, [10,10,160,240]);
% figure; imshow(pic1);

% shen = imread('/Users/punny/Desktop/Digital Image Processing/Images-20220815/hen.bmp');
% imshow(shen);
% vhen=imrotate(shen,2);
% figure, imshow(vhen);
% ghen=rgb2gray(vhen);
% figure, imshow(ghen);
% nhen=imnoise(ghen,'salt & pepper',0.5);
% figure, imshow(nhen);
% chen=medfilt2(nhen);
% figure, imshow(chen);
% 
% help medfilt2


% h0=imread('/Users/punny/Desktop/Digital Image Processing/Images-20220815/hen.bmp');
% h1=imrotate(h0,2);
% h2=imcrop(h1, [55 28 161 150]);
% figure, imshow(h2);
% h3=imresize(h2, [256 256]);
% figure, imshow(h3);
% h4=rgb2gray(h3);
% figure, imshow(h4);
% size(h4)
% 
% [x,y]=meshgrid(1:256, 1:256);
% p=1+sin(x+y/1.5);
% tp=(double(h4)/128+p)/4;
% tf=fftshift(fft2(tp));
% figure, imshow(tp);
% figure, imshow(tf);
% z=sqrt((x-129).^2+(y-129).^2);
% z(156,170)
% z(102,88)
% br=(z<47 | z > 51);
% tbr=tf.*br;
% figure, imshow(tbr);
% tt=ifft2(ifftshift(tbr));
% figure, imshow(tt);


% bo=imread('/Users/punny/Desktop/Digital Image Processing/Images-20220815/board.jpg');
% bg=im2uint8(rgb2gray(bo));
% b=bg(100:351,50:305);
% figure; imshow(b)
% m=fspecial('motion',7,0);
% bm=imfilter(b,m);
% figure; imshow(b); figure; imshow(bm);
% m2=zeros(256,256);
% m2(1,1:7)=m;
% mf=fft2(m2);
% bmi=ifft2(fft2(bm)/mf);
% d=0.02;
% mf=fft2(m2); mf(find(abs(mf)<d))=1;
% bmi=ifft2(fft2(bm)/mf);
% figure; imshow(mat2gray(abs(bmi))*2);

% h=imread('/Users/punny/Desktop/Digital Image Processing/Images-20220815/hanuman.bmp');
% hg=rgb2gray(h);
% figure; imshow(hg); figure; imhist(hg);
% eq=histeq(hg);
% figure; imshow(eq); figure; imhist(eq);

f=imread ('/Users/punny/Desktop/Digital Image Processing/Images-20220815/flower.jpg');
nf=rgb2gray(f);
mf=imresize(nf, [512 512]);
figure; imshow(f); 
figure; imshow(mf);
sobelf=edge(mf,'sobel',0.07);
cannyf=edge(mf,'canny',0.07);
figure; imshow(sobelf); 
figure; imshow(cannyf);

