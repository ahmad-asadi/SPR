X = 0:0.1:6 ;
phi = @(x)(abs(x) <= 0.5) ;
Y = (1/5) * (arrayfun(phi,X - 4) + arrayfun(phi,X - 1) + arrayfun(phi,X - 5) );
plot(X,Y) ;
hold on ;

Y = (1/5) * (arrayfun(phi,X - 3) + arrayfun(phi,X - 2));
plot(X,Y) ;
legend('p^{(x|w1)}','p^{(x|w2)}') ;


