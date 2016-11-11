x1 = -10:.2:10; x2 =-10:.2:10;
[X1,X2] = meshgrid(x1,x2);
C1 = ones(size(x1,2),size(x2,2)) - 0.5 ;
C2 = ones(size(x1,2),size(x2,2)) + 0.5 ;

mu = [1 0];
Sigma = [1 0.5; 0.5 1];
F1 = mvnpdf([X1(:) X2(:)],mu,Sigma);
F1 = reshape(F1,length(x1),length(x2));
surf(x1,x2,F1,C2);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-10 10 -10 10 0 .4])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

hold on;
mu = [-1 0];
Sigma = [1 -0.5; -0.5 1];
F2 = mvnpdf([X1(:) X2(:)],mu,Sigma);
F2 = reshape(F2,length(x2),length(x1));
surf(x1,x2,F2,C1);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-3 3 -4 3 0 .4])
% xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

figure;
F = zeros(size(x1,2), size(x2,2)) - 2;
for i = 1: size(x1,2)
   for j = 1 : size(x2,2) 
       if(F1(i,j) > 0.5 * F2(i,j))
           F(i,j) = 0.1 ;
       end
   end
end
surf(x1,x2,F);
axis([-3 3 -4 3 0 .4])
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
% axis([-10 10 -10 10 0 1])
% C1 = ones(size(x1,2),size(x2,2)) ;
% hold on ;
% surf(x1,x2,(F1./F2),10), C1);
% 
