f1 = @(x)(x) ;
f2 = @(x)(1-x) ;
X = 0:0.01:0.99;
Y1 = arrayfun(f1,X) ;
Y2 = arrayfun(f2,X) ;
Y = [Y1; Y2] ;
h = area(X,Y1) ;
h(1).FaceColor = [0 0 1] ;
hold on ;
h = area(X,Y2) ;
h(1).FaceColor = [0 1 0] ;
hold on ;

Y3 = [Y1(1,1:size(X,2)/2+1),zeros(1,size(X,2)/2-1)] ;
h = area(X,Y3) ;
h(1).FaceColor = [1 1 0] ;
hold on ;
Y3 = [zeros(1,size(X,2)/2),Y2(1,size(X,2)/2+1:end)] ;
h = area(X,Y3) ;
h(1).FaceColor = [1 0 0] ;
hold on ;
