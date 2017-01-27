D = load('dataset1.dat') ;
L = D(:,end) ;
D = D(:,1:end-1) ;
maxK = 10 ;
errors = zeros(maxK,1) ;
for k = 1 : maxK
    errors(k) = KNN_LOO(D,L,k) ;
end
plot(errors) ;
[bestError,bestK] = min(errors) ;
fprintf('The best error rate = %d has been gained in bestK = %d\n' ,bestError , bestK ) ;
for i = 1 : size(errors,1)
    fprintf('Error rate : %d for K : %d \n' , errors(i) , i );
end