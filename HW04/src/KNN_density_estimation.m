function Y = KNN_density_estimation(D,N,X1,X2)
Y = zeros(size(X1,2) , size(X2,2)) ;
for i = 1 : size(X1,2)
   for j = 1 : size(X2,2) 
       X = [X1(i);X2(j)] ;
       r1 = inf ;
       r2 = inf ;
       r3 = inf ;
       for k = 1 : size(D,1)
           XK = D(k,:).';
           R = sum((XK-X).'*(XK-X)) ;
           if(R <= r1)
               if(k==3)
                   disp('here') ;
               end
               r3 = r2 ;
               r2 = r1 ;
               r1 = R ;
           elseif(R <= r2)
               r3 = r2 ;
               r2 = R ;
           elseif(R <= r3)
               r3 = R ;
           end
       
       end
       V = r1+10*r2+r3 ;
       if(V == 0)
           V = 0.0001 ;
       end
       Y(i,j) = 1/V  ;
   end
end






   



