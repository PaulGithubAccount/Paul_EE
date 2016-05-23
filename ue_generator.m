function mobiles=ue_generator(base,pico,V)
param;
rand('state',sum(100*clock));    %????????
location = [];

%% UE number initialize
Ni=randi(UE_max,1,T);  %random UE number in one time slot: UE number in a small cell 0~6 uniformly distributed
N=num_pico*Ni;   % UE number

%% Initialzie
mobiles.location=cell(T,1);
mobiles.direction=cell(T,1);;
mobiles.velocity=V;
mobiles.shadowing = [];
mobiles.distance=[];
mobiles.pathloss=[];
mobiles.angle=[];
mobiles.amount=N;
mobiles.SIR=[];
mobiles.nRx = 2;
mobiles.nfft = 1024;

%% 
%{
for a=1:N
    b=1;
    while(b==1)
        x = radius/2*sqrt(3)*(rand(1,1)*2-1);
        y = radius*(rand(1,1)*2-1);
        loc = (x) + 1i*(y);
        if (1/sqrt(3)*(x+radius/2*sqrt(3))>y-radius/2)&&(-1/sqrt(3)*(x-radius/2*sqrt(3))>y-radius/2)&&(-1/sqrt(3)*(x+radius/2*sqrt(3))<y+radius/2)&&(1/sqrt(3)*(x-radius/2*sqrt(3))<y+radius/2)&&(abs(loc)>=atleast_dis)
            if (sum(abs(loc-pico.location)<10)==0)
                location(a) = loc;
                b=0;
            end
        end
    end
end
%}
% plot(loc,'m');hold on;
%%
%location=[0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i 0+0i];
% for c=1:N
%     b=1;
%     while(b==1)
%        x = pico_centerx+50*(rand(1,1)*2-1);
%        y = pico_centery+50*(rand(1,1)*2-1);
%        loc = (x) + 1i*(y);
%        if ((sum(abs(loc-location)<=10)==0)||(c==1))&&abs(loc)<=radius*sqrt(3)/2  %%40m
%             location(c) = loc;
%             b=0;
%        end
%     end
% end
for t=1:T
    location=0;
    for c=1:N(t)
        b=1;
        while(b==1)
           x = real(pico.location(ceil(c/(N(t)/num_pico))))+10*(rand(1,1)*2-1);
           y = imag(pico.location(ceil(c/(N(t)/num_pico))))+10*(rand(1,1)*2-1);   % 25 m
           loc = (x) + 1i*(y);
           if ((sum(abs(loc-location)<=5)==0)||(c==1))&&abs(loc)<=radius*sqrt(3)/2  %%40m  %% 10
                location(c) = loc;
                b=0;
           end
        end
    end

    rand('state',sum(rand*111*clock));
    direction=2*pi*rand(1,N(t));

    mobiles.location{t}=location;
    mobiles.direction{t}=direction;
    mobiles.velocity(t)=V;
%     mobiles.shadowing(t) = [];
%     mobiles.distance(t)=[];
%     mobiles.pathloss(t)=[];
%     mobiles.angle(t)=[];
% %     mobiles.amount(t)=N(t);
%     mobiles.SIR(t,:)=[];
%     mobiles.nRx(t) = 2;
%     mobiles.nfft(t) = 1024;
end
% cell
% t=1;
% for c=1:N
%         b=1;
%         while(b==1)
%            x = real(pico.location(ceil(c/(N/num_pico))))+25*(rand(1,1)*2-1);
%            y = imag(pico.location(ceil(c/(N/num_pico))))+25*(rand(1,1)*2-1);
%            loc = (x) + 1i*(y);
%            if ((sum(abs(loc-location)<=10)==0)||(c==1))&&abs(loc)<=radius*sqrt(3)/2  %%40m
%                 location(c) = loc;
%                 b=0;
%            end
%         end
%     end
% 
%     rand('state',sum(rand*111*clock));
%     direction=2*pi*rand(1,N(t));
% 
%     mobiles.location=location;
%     mobiles.direction=direction;
%     mobiles.velocity=V;
%     mobiles.shadowing = [];
%     mobiles.distance=[];
%     mobiles.pathloss=[];
%     mobiles.angle=[];
%     mobiles.amount=N;
%     mobiles.SIR=[];
%     mobiles.nRx = 2;
%     mobiles.nfft = 1024;
end