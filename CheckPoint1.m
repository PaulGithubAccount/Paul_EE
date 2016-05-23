function [ output_args ] = CheckPoint1( eNB,pico,UE )
% This function check base station, small cell and UE
% Plot base station,small cell and UE
param;
for t=1:T
    figure();
    hold on;
    plot(real(eNB.location),imag(eNB.location),'r^');
    % plot cell boundary
    index=1;
    for i=1:length(eNB.location)
        for k=0:6
            point(k+1)=real(eNB.location(i))+real(radius*exp(j*(pi/2+pi/3*k)))+j*(imag(eNB.location(i))+imag(radius*exp(j*(pi/2+pi/3*k))));
        end
        plot(real(point),imag(point),'b-');
    end
    plot(pico_centerx,pico_centery,'b^');
    plot(real(pico.location),imag(pico.location),'bo');
    hold on;
    plot(reshape(UE.location{t}(1:UE.amount(t)/num_pico),1,[]),'g*');
%     plot(reshape(UE.location(1:5),1,[]),'g*')
    plot(reshape(UE.location{t}(UE.amount(t)/num_pico+1:2*UE.amount(t)/num_pico),1,[]),'r*')
    plot(reshape(UE.location{t}(2*UE.amount(t)/num_pico+1:end),1,[]),'b*');

end

end

