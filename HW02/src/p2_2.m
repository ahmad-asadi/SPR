P1 = 0.5 ;
P2 = 0.5 ;
M1 = [1;0] ;
M2 = [-1;0] ;
Sigma1 = [4 -3 ; -3 4] ;
Sigma2 = [4 3 ; 3 4] ;

fun = @(x)(exp(-0.5*(x.^2))/(sqrt(2*pi))) ;

best_epsilon = Inf ;
worst_epsilon = 0 ;
best_s = -1 ;

S = 0:0.01:1 ;
bEps = zeros(size(S,2));

ind = 1 ;
for s = 0 : 0.01 : 1
    V = ((M2 - M1) \ (s * Sigma1 + (1-s) * Sigma2)).';
    sigm1 = V.' * Sigma1 * V ;
    sigm2 = V.' * Sigma2 * V ;
    v0 = (s*(sigm1^2)*(V.'*M2) + (1-s)*(sigm2^2)*(V.'*M1)) / (s*(sigm1^2) + (1-s)*(sigm2^2)) ;
    eta1 = V.' * M1 + v0 ;
    eta2 = V.' * M2 + v0 ;
    epsilon = P1 * integral(fun, -eta1/sigm1, Inf) + P2 * integral(fun , -Inf , -eta2/sigm2) ;
    if(epsilon <= best_epsilon)
        best_epsilon = epsilon ;
        best_s = s;
        best_V = V ;
        best_v0 = v0 ;
    end
    if(epsilon >= worst_epsilon)
        worst_epsilon = epsilon ;
        worst_s = s;
        worst_V = V ;
        worst_v0 = v0 ;
    end
    bEps(ind) = epsilon ;
    ind = ind + 1 ;
end

plot(S, bEps) ;
fprintf('the best error probability is %d resulted by s = %d and the threshold v0 = %d\n', best_epsilon, best_s, best_v0) ;
fprintf('the worst error probability is %d resulted by s = %d and the threshold v0 = %d\n', worst_epsilon, worst_s, worst_v0) ;

X1 = mvnrnd(M1, Sigma1, 1000) ;
X2 = mvnrnd(M2, Sigma2, 1000) ;
x1 = best_V.' * X1.' ;
x2 = best_V.' * X2.' ;
figure;
[nb,xb]=hist(x1,10);
bh=bar(xb,nb);
set(bh,'facecolor',[1 1 0]);
hold on
[nb,xb]=hist(x2,10);
bh=bar(xb,nb);
set(bh,'facecolor',[0 1 1]);

figure;
x1 = worst_V.' * X1.' ;
x2 = worst_V.' * X2.' ;
figure;
[nb,xb]=hist(x1,10);
bh=bar(xb,nb);
set(bh,'facecolor',[1 1 0]);
hold on
[nb,xb]=hist(x2,10);
bh=bar(xb,nb);
set(bh,'facecolor',[0 1 1]);
