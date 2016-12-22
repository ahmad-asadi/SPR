D =[0.0 1
    0.1 2
    0.1 9
    0.3 2
    0.4 1
    0.4 8];
N = size(D,1) ;
X1 = -0.5 :0.01: 1 ;
X2 = -1 : 0.1: 10 ;
h = 0.1 ;
Y = normal_parzen(X1,X2,D,h,N);
surf(X1.',X2.',Y.');
figure;
h = 0.01 ;
Y = normal_parzen(X1,X2,D,h,N);
surf(X1.',X2.',Y.');
