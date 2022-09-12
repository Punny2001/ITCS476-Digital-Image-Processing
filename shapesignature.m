S = imread('/Users/punny/Documents/GitHub/Digital Image Processing/king.png');
S = im2bw(S);
imshow(S);

[B,L,N,A] = bwboundaries(S);
imshow(S);
for cnt = 1:N
hold on;
boundary = B{cnt};
plot(boundary(:,2), boundary(:,1),'r'); 
hold on;
text(mean(boundary(:,2)), mean(boundary(:,1)),num2str(cnt));
end
figure;
subplotrow = ceil(sqrt(N));

for cnt = 1:N
boundary = B{cnt};
[th, r]=cart2pol(boundary(:,2)-mean(boundary(:,2)), ...
boundary(:,1)-mean(boundary(:,1)));
subplot(subplotrow,N/subplotrow,cnt);
plot(th,r,'.');
axis([-pi pi 0 512]);
xlabel('radian');ylabel('r');
title(['Object ', num2str(cnt)]);
end


