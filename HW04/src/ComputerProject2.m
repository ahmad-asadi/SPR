mean = 0 ;
sigma2 = 1 ;
mu = [0 0 ] ;
Sigma2 = eye(2) ;
X1 = normrnd(mean , sigma2 , [30,1]);
X2 = mvnrnd(mu , Sigma2,30) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Parzen MODEL    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('effect of kernel functions to estimate one dimensional normal function');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen kernel 1
disp('first kernel ... ');
H1 = 1 ;
kernel1 = @(X)((abs(X) <= H1)/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0 , mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;
hold off;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen kernel 2
disp('second kernel .... ') ;
kernel1 = @(X)((normpdf(X,mean , sigma2/10) > 0.1)/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)/4) ;
hold on ;
plot(X1Range , F) ;
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen kernel 3
disp('third kernel .... ') ;
kernel1 = @(X)((normpdf(X,mean , sigma2) > 0.1)/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen bandwidth 2
disp('second bandwidth .... ') ;
H1 = 0.1 ;
kernel1 = @(X)((normpdf(X,mean , sigma2) > normpdf(H1,mean, sigma2))/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;
hold off;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen bandwidth 3
disp('third bandwidth .... ') ;
H1 = 1 ;
kernel1 = @(X)((normpdf(X,mean , sigma2) > normpdf(H1,mean, sigma2))/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;
hold off;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% parzen bandwidth 4
disp('fourth bandwidth .... ') ;
H1 = 10 ;
kernel1 = @(X)((normpdf(X,mean , sigma2) > normpdf(H1,mean, sigma2))/2) ;
X1Range = -10:0.01:10 ;

F = parzen(X1, H1 , kernel1, X1Range , 1).' ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;
hold off;

disp('effect of kernel functions to estimate two dimensional normal function');
X1Range = -10:0.3:10 ;
X2Range = -10:0.3:10 ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2D Normal assumed density 
mu = [0 0];
Sigma = [1 0; 0 1];
x1 = X1Range; x2 = X2Range;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-10 10 -10 10 0.2])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dparzen kernel 1
disp('first kernel ... ');
H1 = 0.5 ;
kernel1 = @(X)((sum(X.^2) <= H1)/2) ;
F = parzen(X2, H1 , kernel1, X1Range , X2Range).' ;

surf(X1Range, X2Range , F.') ;
hold off;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dparzen kernel 2
disp('second kernel ... ');
H1 = 0.5 ;
kernel1 = @(X)((mvnpdf(X,mu , Sigma2) > mvnpdf([1 1] , mu , Sigma2))/2) ;
F = parzen(X2, H1 , kernel1, X1Range , X2Range).' ;

surf(X1Range, X2Range , F.') ;
hold off;





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dparzen bandwidth 2
disp('second bandwidth ... ');
H1 = 0.1 ;
kernel1 = @(X)((sum(X.^2) <= H1)/2) ;
F = parzen(X2, H1 , kernel1, X1Range , X2Range).' ;

surf(X1Range, X2Range , F.') ;
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dparzen bandwidth 3
disp('third bandwidth ... ');
H1 = 1 ;
kernel1 = @(X)((sum(X.^2) <= H1)/2) ;
F = parzen(X2, H1 , kernel1, X1Range , X2Range).' ;

surf(X1Range, X2Range , F.') ;
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dparzen bandwidth 4
disp('third bandwidth ... ');
H1 = 10 ;
kernel1 = @(X)((sum(X.^2) <= H1)/2) ;
F = parzen(X2, H1 , kernel1, X1Range , X2Range).' ;

surf(X1Range, X2Range , F.') ;
hold off;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    KNN MODEL    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



disp('Analyzing KNN model with different Ks for assumed one dimensional distribution') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% knn k 1
F = KNN_Density(X1 , 1 , X1Range , 1) ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% knn k 3
F = KNN_Density(X1 , 3 , X1Range , 1) ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% knn k 5
F = KNN_Density(X1 , 5 , X1Range , 1) ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% knn k 10
F = KNN_Density(X1 , 10 , X1Range , 1) ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% knn k 20
F = KNN_Density(X1 , 20 , X1Range , 1) ;
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
plot(X1Range , F) ;


disp('Analyzing KNN model with different Ks for assumed two dimensional distribution') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dknn k 1
F = KNN_Density(X2 , 1 , X1Range , X2Range) ;
figure ;
surf(X1Range.' , X2Range.', F.') ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dknn k 3
F = KNN_Density(X2 , 3 , X1Range , X2Range) ;
figure ;
surf(X1Range.' , X2Range.', F.') ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dknn k 5
F = KNN_Density(X2 , 5 , X1Range , X2Range) ;
figure ;
surf(X1Range.' , X2Range.', F.') ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dknn k 10
F = KNN_Density(X2 , 10 , X1Range , X2Range) ;
figure ;
surf(X1Range.' , X2Range.', F.') ;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2Dknn k 20
F = KNN_Density(X2 , 20 , X1Range , X2Range) ;
figure ;
surf(X1Range.' , X2Range.', F.') ;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    Histogram MODEL    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


disp('Analyzing Histogram model with different bin counts for assumed one dimensional distribution') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 2
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
histogram(X1,2,'Normalization','Pdf') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 5
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
histogram(X1,5,'Normalization','Pdf') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 10
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
histogram(X1,10,'Normalization','Pdf') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 20
figure ;
plot(X1Range, gaussmf(X1Range ,[1 0])*normpdf(0,mean , sigma2)) ;
hold on ;
histogram(X1,20,'Normalization','Pdf') ;

disp('Analyzing Histogram model with different bin counts for assumed two dimensional distribution') ;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 2 * 2
figure ;
hist3(X2, [2,2]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 5 * 5
figure ;
hist3(X2, [5,5]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 10 * 10
figure ;
hist3(X2, [10,10]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% hist bin 20 * 20
figure ;
hist3(X2, [20,20]);



