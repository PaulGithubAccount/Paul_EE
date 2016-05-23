function result = ant_pattern(mobile)

theta_3dB = 70;
result = mobile;
result.ant = -min(12*((result.angle/theta_3dB).^2),20);