% a)
mu = [1;0] ;
sigma = [5 , 0 ; 0 , 5] ;
X = mvnrnd(mu , sigma , 100) ;
sampleMean = mean(X) ;
sampleSigma = cov(X) ;
disp('sample mean of the case a: ') ;
disp(sampleMean) ;
disp('sample covariance of the case a: ') ;
disp(sampleSigma) ;

% b)
mu = [2;0] ;
sigma = [5 , 0 ; 0 , 10] ;
X = mvnrnd(mu , sigma , 100) ;
sampleMean = mean(X) ;
sampleSigma = cov(X) ;
disp('sample mean of the case b: ') ;
disp(sampleMean) ;
disp('sample covariance of the case b: ') ;
disp(sampleSigma) ;

% c)
mu = [-1;1] ;
sigma = [5 , 6 ; 6 , 10] ;
X = mvnrnd(mu , sigma , 100) ;
sampleMean = mean(X) ;
sampleSigma = cov(X) ;
disp('sample mean of the case c: ') ;
disp(sampleMean) ;
disp('sample covariance of the case c: ') ;
disp(sampleSigma) ;
