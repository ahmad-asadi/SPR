X = [0 4
    8 3] ;
Y = [6 -2
    4 0
    2 1] ;
scatter(X(:,1), X(:,2),'r');
hold on ;
scatter(Y(:,1), Y(:,2),'b');
hold on ;

Xl = -1 : 10 ;
Yl = (0.3)*Xl + 0.4 ;

plot(Xl , Yl) ;
hold on ;


axis([-1 10 -3 5]) ;
