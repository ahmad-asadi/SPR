P1 = 0.5 ;
P2 = 0.5 ;
M1 = [1;0] ;
M2 = [-1;0] ;
Sigma1 = [4 -3 ; -3 4] ;
Sigma2 = [4 3 ; 3 4] ;

V = [-0.5;0] ;

iterCount = 1000 ;
best_alpha = zeros(iterCount,1) - 4 ;


for i = 1 : iterCount
    best_hitRatio = -1 ;
    W1 = mvnrnd(M1, Sigma1, 1000) ;
    W2 = mvnrnd(M2, Sigma2, 1000) ;
for alpha = -4:0.01:4


   tp = size(find(W1_new <= alpha),2) ;
   fp = size(find(W2_new <= alpha),2) ;
   
   tn = size(find(W2_new > alpha),2) ;
   fn = size(find(W1_new > alpha),2) ;
   
   hitRatio = (tp + tn - fp - fn) / (size(W1_new,1) + size(W2_new,1)) ;
   if(hitRatio > best_hitRatio)
       best_hitRatio = hitRatio ;
       best_alpha(i) = alpha ;
   end
end
end
hist(best_alpha) ;
fprintf('estimated best_alpha: %d\n', mean(best_alpha)) ;