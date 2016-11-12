mu1 = [0,0];
mu2 = mu1 ;
sigma1 = [1 0; 0 4] ;
sigma2 = [4 0; 0 1] ;

[X1, X2] = meshgrid(-10:0.2:10) ;
F1 = mvnpdf([X1(:) X2(:)],mu1,sigma1);
F1 = reshape(F1,length(X2),length(X1));

F2 = mvnpdf([X1(:) X2(:)],mu2,sigma2);
F2 = reshape(F2,length(X2),length(X1));

contour(X1,X2,F1,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
hold on;
contour(X1,X2,F2,[.0001 .001 .01 .05:.1:.95 .99 .999 .9999]);
hold on ;
xlabel('x1'); ylabel('x2');

[X1, X2] = meshgrid(-10:10) ;

fun1 = @(x1, x2)(x2^2 - x1^2) ;
label1 = zeros(size(X1,2) , size(X2,2)) ;
label2 = zeros(size(X1,2) , size(X2,2)) ;
for i = 1 :size(X1,2)
    for j = 1 : size(X2,2)
        if(fun1(X1(1,i) , X2(j,1)) > 0)
            scatter(X1(1,i), X2(j,1) , 'b') ;
            drawnow ;
            hold on ;
        else
            scatter(X1(1,i), X2(j,1) , 'r') ;
            drawnow ;
            hold on ;
        end
    end
end
