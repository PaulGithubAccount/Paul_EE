function [d result]=pathloss_macro(eNB,pico,mobile)
param;
h=20;
W=20;
%% outdoor macro
result = mobile;
cc_freq_tmp = cc_freq/1e9; %GHz
% result.LOS_macro = zeros(result.amount,length(eNB.location));
% result.LOS_prob_macro = min( 18./result.distance_macro, 1. ) .* ( 1. - exp( -result.distance_macro/63. ) ) + exp( -result.distance_macro/63. );
% r = rand(result.amount,length(eNB.location));
% result.LOS_macro(r < result.LOS_prob_macro) = true ;
% result.LOS_macro(r >= result.LOS_prob_macro) = false;
% result.shadowing_LOS_macro = 4;
% result.shadowing_NLOS_macro = 6;
% result.pathloss_macro = zeros(result.amount,length(eNB.location),num_CC);
% d = result.distance_macro;
% LoS = result.LOS_macro;
% cc_freq_tmp = cc_freq/1e9; %GHz
% for c=1:num_CC
%     result.pathloss_macro(LoS==1,c) = 22.0*log10(d(LoS==1)) + 28.0 + 20*log10(cc_freq_tmp(c)) + result.shadowing_LOS_macro;
%     result.pathloss_macro(LoS==0,c) = 161.04-7.1*log10(20)+7.5*log10(20)-(24.37-3.7*(20/25)^2)*log10(25)+(43.42-3.1*log10(25))*(log10(d(LoS==0))-3)+20*log10(cc_freq_tmp(c))-(3.2*(log10(11.75*1.5))^2-4.97) + result.shadowing_NLOS_macro;
% end
% result.pathloss_macro = result.pathloss_macro + pene_loss;
%%%%

% result.pathloss_macro = result.pathloss_macro;

% result.pathloss_macro(result.LOS_macro==1) = 103.4 + 24.2*log10(result.distance_macro(result.LOS_macro==1)/1000) + result.shadowing_LOS_macro;
% result.pathloss_macro(result.LOS_macro==0) = 131.1 + 42.8*log10(result.distance_macro(result.LOS_macro==0)/1000) + result.shadowing_NLOS_macro;
%% outdoor smallCell
%%%have comment some nonsense
for t=1:T
    if num_pico>0
%     d=0;
    result.LOS_smallCell{t} = zeros(result.amount(t),length(pico.location));
    result.LOS_prob_smallCell{t} = 0.5-min(0.5,5*exp(-156./result.distance_smallCell{t})) + min(0.5,5*exp( -result.distance_smallCell{t}/30));
    r = rand(result.amount(t),length(pico.location));
    result.LOS_smallCell{t}(r < result.LOS_prob_smallCell{t}) = true ;
    result.LOS_smallCell{t}(r >= result.LOS_prob_smallCell{t}) = false;
    result.shadowing_LOS_smallCell = 3;
    result.shadowing_NLOS_smallCell = 4;
%     result.pathloss_smallCell{t} = zeros(result.amount(t),length(pico.location),num_CC);
    result.pathloss_smallCell{t} = zeros(result.amount(t),length(pico.location));
    d{t} = result.distance_smallCell{t};
    LoS = result.LOS_smallCell{t};
    for a=1:result.amount(t)
        result.pathloss_smallCell{t}(a,LoS(a,:)==1) = 22.0*log10(d{t}(a,LoS(a,:)==1)) + 28.0 + 20*log10(cc_freq_tmp(1)) + result.shadowing_LOS_smallCell;
        result.pathloss_smallCell{t}(a,LoS(a,:)==0) = 36.7*log10(d{t}(a,LoS(a,:)==0)) + 22.7 + 26*log10(cc_freq_tmp(1)) + result.shadowing_NLOS_smallCell;
    end

    result.pathloss_smallCell{t} = result.pathloss_smallCell{t} + pene_loss;
    result.pathloss_smallCell{t}=10.^(-result.pathloss_smallCell{t}./10);
    end
end

% result.pathloss_smallCell = result.pathloss_smallCell;

% result.pathloss_smallCell(result.LOS_smallCell==1) = 103.8 + 20.9*log10(result.distance_smallCell(result.LOS_smallCell==1)/1000) + result.shadowing_LOS_smallCell;
% result.pathloss_smallCell(result.LOS_smallCell==0) = 145.4 +
% 37.5*log10(result.distance_smallCell(result.LOS_smallCell==0)/1000) + result.shadowing_NLOS_smallCell;
end

