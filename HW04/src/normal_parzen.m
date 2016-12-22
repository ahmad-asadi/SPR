function Y = normal_parzen(X1, X2, D, h,N)
Y = zeros(size(X1,2),size(X2,2)) ;
for i = 1 : size(X1,2)
   for j = 1 : size(X2,2) 
       x1 = X1(i);
       x2 = X2(j) ;
       X = [x1 ; x2] ;
       t = 0 ;
       for k = 1 : size(D,1)
           XK = D(k,:).' ;
           t = t + exp(-0.5 * (X-XK).'*(X-XK) / (h^2)) ;
       end
       Y(i,j) = t /(N*pi*(h^2)) ;     
   end
end

