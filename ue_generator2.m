function mobiles=ue_generator2(base,pico,V) 
param;
location=zeros(1,N);
for j=1:N
r=radius;
phi=rand(1)*2*pi;
x=r*cos(phi)*rand(1)+1;
y=r*sin(phi)*rand(1);
location(j)= x+y*1i;
end
rand('state',sum(rand*111*clock));
direction=2*pi*rand(1,N);
mobiles.location=location;
mobiles.direction=direction;
mobiles.velocity=V;
mobiles.shadowing = [];
mobiles.distance=[];
mobiles.pathloss=[];
mobiles.angle=[];
mobiles.amount=N;
mobiles.SIR=[];
mobiles.nRx = 2;
mobiles.nfft = 1024;
end