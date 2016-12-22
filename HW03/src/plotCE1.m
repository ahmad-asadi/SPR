scatter(W3(:,1),W3(:,2),'r');
hold on ;
scatter(W2(:,1),W2(:,2),'b');
hold on ;
X1 = min([W3(:,1);W2(:,1)]):0.1:max([W3(:,1);W2(:,1)]) ;
X3 = ones(1,size(X1,2)) ;
X2 = (-a(1)/a(2))*X1 - (a(3)/a(2))*X3  ;

plot(X1, X2,'r');

