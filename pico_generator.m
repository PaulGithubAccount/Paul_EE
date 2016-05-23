function pico=pico_generator(base)         
param;

rand('state',sum(100*clock));    %????????
location = [];
%{
for c=1:num_pico
    b=1;
    while(b==1)
%         x = pico_centerx+radius/2*sqrt(3)*(rand(1,1)*2-1);
%         y = pico_centery+radius*(rand(1,1)*2-1);
        x = pico_centerx+50*(rand(1,1)*2-1);
        y = pico_centery+5*(rand(1,1)*2-1);
        loc = (x) + 1i*(y);
        if (1/sqrt(3)*(x+radius/2*sqrt(3))>y-radius/2)&&(-1/sqrt(3)*(x-radius/2*sqrt(3))>y-radius/2)&&(-1/sqrt(3)*(x+radius/2*sqrt(3))<y+radius/2)&&(1/sqrt(3)*(x-radius/2*sqrt(3))<y+radius/2)&&(abs(loc)>=75)
            if (sum(abs(loc-location)<=40)==0)||(c==1)  %%40m
                location(c) = loc;
%                 LOS_prob(c) = 0.5-min(0.5,5*exp(-156/abs(loc))) + min(0.5,5*exp(-abs(loc)/30));
%                 if rand < LOS_prob(c)
%                     result.LOS(c) = true ;
%                 else
%                     result.LOS(n,i) = false ;
%                 end
                b=0;
            end
        end
    end
end
%}
% for c=1:num_pico
%     x = pico_centerx+50*(rand(1,1)*2-1);
%     y = pico_centery+50*(rand(1,1)*2-1);
%     location(c) = (x) + 1i*(y);
% end
for c=1:num_pico
    b=1;
    while(b==1)
       x = pico_centerx+40*(rand(1,1)*2-1);
       y = pico_centery+40*(rand(1,1)*2-1);
       loc = (x) + 1i*(y);
       if ((sum(abs(loc-location)<=40)==0)||(c==1))&&abs(loc)<=radius*sqrt(3)/2  %%40m
            location(c) = loc;
%                 LOS_prob(c) = 0.5-min(0.5,5*exp(-156/abs(loc))) + min(0.5,5*exp(-abs(loc)/30));
%                 if rand < LOS_prob(c)
%                     result.LOS(c) = true ;
%                 else
%                     result.LOS(n,i) = false ;
%                 end
            b=0;
        end
       % end
    end
end
rand('state',sum(rand*111*clock));
%location= [0+0.01i 0-0.01i 0+0.01i];
pico.location=location;

% pico.LOS_prob = LOS_prob;
% plot([250+1i*500,250-1i*500],'g-');hold on;
% plot([-250+1i*500,-250-1i*500],'g-');hold on;
% plot([1i*radius,500],'g-');hold on;
% plot([1i*radius,-500],'g-');hold on;
% plot([-1i*radius,500],'g-');hold on;
% plot([-1i*radius,-500],'g-');hold on;
alpha=0:pi/20:2*pi;
R=35;
x=R*cos(alpha);
y=R*sin(alpha);
% plot(x,y,'-')
%axis equal
end