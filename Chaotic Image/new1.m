
clear all
clc
 p = imread('gc.jpg');
%    p = rgb2gray(p);
 for i=1:size(p,1)
     for j=1:size(p,2)
         q(i,j,:) = de2bi(p(i,j),8);
     end
 end
sigma=10;
beta=8/3;
rho=28;
f = @(t,a) [-sigma*a(1) + sigma*a(2); rho*a(1) - a(2) - a(1)*a(3); -beta*a(3) + a(1)*a(2)];
%'f' is the set of differential equations and 'a' is an array containing values of x,y, and z variables.
%'t' is the time variable
[t,a] = ode45(f,[0:0.1:301],[2 0 1]);%'ode45' uses adaptive Runge-Kutta method of 4th and 5th order to solve differential equations

for i=1:3
    b(i)=a(3001,i) ;
end
i3=b(1) ;
j3=b(2) ;
k3=b(3) ;
for i1=1:size(q,2)
    for j1=1:size(q,1)
[t,c] = ode45(f,[0:0.2:1.4],[i3 j3 k3]);
xmin=min(c(:,1)) ;
ymin=min(c(:,2)) ;
xmax=max(c(:,1)) ;
ymax=max(c(:,2)) ;
for i=1:8
    if (c(i,1)-xmin)/(xmax-xmin)>=0.5
        w1(i)= 1 ;
    else
      w1(i)= -1 ;
    end
end
 for i=1:8
    if (c(i,2)-ymin)/(ymax-ymin)>=0.5
        w2(i)= 1 ;
    else
      w2(i)= -1 ;
    end
 end
z8=c(8,3) ;   
r=floor((z8-floor(z8))*256);
sum1=0 ;
sum2=0 ;
for j=1:8
sum1=sum1+bitxor((w1(j)+1)*(2^(j-2)),r);  %j-1 or j-2?
end
for j=1:8
sum2=sum2+bitxor((w2(j)+1)*(2^(j-2)),r);  %j-1 or j-2?
end       
i3=xmin+((c(8,1)-xmin)*sum1)/256 ;   
j3=ymin+((c(8,2)-ymin)*sum2)/256 ;  
k3=c(8,3) ;
 for k1=1:8
   thetak=bitxor(((w1(k1)+1))/2,((w2(k1)+1))/2);
   if w1(k1)==1
      e(i1,j1,k1)=heaveside(q(i1,j1,k1)*w1(k1)-w1(k1)*w2(k1)/2-thetak); 
   else
       e(i1,j1,k1)=heaveside(q(i1,j1,k1)*w1(k1)-w1(k1)*w2(k1)/2+thetak); 
   end
%   if w1(k1)==-1&&(q(i1,j1,k1)==1)        
%      e(i1,j1,k1)=heaveside(1+w1(k1)*w2(k1)/2 + thetak) ;    
%   end
%   if w1(k1)==-1&&(q(i1,j1,k1)==0)
%      e(i1,j1,k1)=heaveside(w1(k1)*w2(k1)/2 + thetak) ;    
 %   end
 end
 end
end
z=zeros(size(e,1),size(e,2)) ;
for i=1:size(z,1)
for j=1:size(z,2)
for k=1:8
z(i,j)=z(i,j)+(e(i,j,k)*2^(k-1)) ;
end
end
end
I = mat2gray(z);
imshow(I)
NPCR_and_UACI('gc.jpg','gcencypt1.jpg');
