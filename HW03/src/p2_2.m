theta = 0:0.01:1 ;
Y = (1./theta).^5 ;
Y(1:60) = 0 ;
plot(theta, Y) ;