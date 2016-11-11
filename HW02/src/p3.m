%%LINEAR
x1 = -5:0.2:5; x2 =-5:0.2:5;
[X1,X2] = meshgrid(x1,x2);
C1 = ones(size(x1,2),size(x2,2)) - 0.5 ;
C2 = ones(size(x1,2),size(x2,2)) + 0.5 ;
C3 = ones(size(x1,2),size(x2,2)) ;
Sigma = [1 0; 0 0.3333];

mu = [0 2];
F1 = mvnpdf([X1(:) X2(:)],mu,Sigma);
F1 = reshape(F1,length(x1),length(x2));
surf(x1,x2,F1,C1);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold on ;

mu = [3 1];
F1 = mvnpdf([X1(:) X2(:)],mu,Sigma);
F1 = reshape(F1,length(x1),length(x2));
surf(x1,x2,F1,C2);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold on ;

mu = [1 0];
F1 = mvnpdf([X1(:) X2(:)],mu,Sigma);
F1 = reshape(F1,length(x1),length(x2));
surf(x1,x2,F1,C3);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

fun1 = @(x,y)(-3*x + y + 3) ;
fun2 = @(x,y)(-0.5*x + y - 0.75) ;
fun3 = @(x,y)(2*x + y - 4.5) ;

figure
F1 = zeros(size(X1,1) , size(X1,2)) ;
F2 = zeros(size(X1,1) , size(X1,2)) ;
F3 = zeros(size(X1,1) , size(X1,2)) ;

for i = 1 :size(F1,1)
    for j = 1 :size(F1,2)
        if(fun1(x1(i), x2(j)) > 0 && fun2(x1(i), x2(j))>0)
            F1(i,j) = 1 ;
        end
        if(fun1(x1(i), x2(j)) < 0 && fun3(x1(i), x2(j))>0)
            F2(i,j) = 0.5 ;
        end
        if(fun2(x1(i), x2(j)) < 0 && fun3(x1(i), x2(j))<0)
            F3(i,j) = 0 ;
        end
    end
end

surf(x1,x2,F1,C1);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold on;

surf(x1,x2,F2,C2);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
hold on;

surf(x1,x2,F3,C3);
axis([-3 5 -2 3 0 1])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
