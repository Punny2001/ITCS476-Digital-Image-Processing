function out=chaincode8(image)
n=[0 1;-1 1;-1 0;-1 -1;0 -1;1 -1;1 0;1 1];
flag=1;
cc=[ ];
[x y]=find(image==1);
x=min(x);
imx=image(x,:);
y=find(imx==1, 1 );
first=[x y];
dir=7;
while flag==1
          tt=zeros(1,8);
         newdir=mod(dir+7-mod (dir,2),8);
          for i=0:7
              j=mod(newdir+i,8)+1;
              tt(i+1)=image(x+n(j,1),y+n(j,2)); 
          end
    d=find(tt==1, 1 );
          dir=mod(newdir+d-1,8); 
    cc=[cc,dir];
    x=x+n(dir+1,1);y=y+n(dir+1,2);
    
    if x==first(1)&&y==first(2)
        flag=0;
    end
end
out=cc;
end
