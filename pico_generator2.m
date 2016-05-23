function pico=pico_generator2(base) 
param;
location=zeros(1,num_pico);
for j=1:num_pico
phi=rand(1)*2*pi;
x=rrrr*cos(phi)*rand(1)+1;
y=rrrr*sin(phi)*rand(1);
location(j)= x+y*1i;
end
pico.location=location;
end