% a)
mu = [1;0] ;
sigma = [5 , 0 ; 0 , 5] ;
X = mvnrnd(mu , sigma , 100) ;
figure ;
title('case a') ;
scatter(X(:,1) , X(:,2)) ;

% b)
mu = [2;0] ;
sigma = [5 , 0 ; 0 , 10] ;
X = mvnrnd(mu , sigma , 100) ;
figure ;
title('case b') ;
scatter(X(:,1) , X(:,2)) ;

% c)
mu = [-1;1] ;
sigma = [5 , 6 ; 6 , 10] ;
X = mvnrnd(mu , sigma , 100) ;
figure ;
title('case c') ;
scatter(X(:,1) , X(:,2)) ;
