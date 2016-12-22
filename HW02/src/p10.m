X1 = [1 1
    1 2
    1 3
    2 1
    3 1
    3 3
    ];

X2 = [2 2
    3 2
    3 4
    5 1
    5 4
    5 5
    ];
M1 = mean(X1).' ;
S1 = cov(X1) ;
M2 = mean(X2).' ;
S2 = cov(X2) ;


% V = [51.5220; 35.3241];
% X1 = V.' * X1.' ;
% X2 = V.' * X2.' ;

best_epsilon = Inf ;
worst_epsilon = 0 ;
best_s = -1 ;
ind = 1 ;
for s = 0:0.01:1
    V = ((M2 - M1) \ (s * S1 + (1-s) * S2)).';
    vs1 = V.' * S1 * V ;
    vs2 = V.' * S2 * V ;
    v0 = (s*(vs1^2)*(V.'*M2) + (1-s)*(vs2^2)*(V.'*M1)) / (s*(vs1^2) + (1-s)*(vs2^2)) ;
    eta1 = V.' * M1 + v0 ;
    eta2 = V.' * M2 + v0 ;
    x1 = V.' * X1.' ;
    x2 = V.' * X2.' ;
    epsilon = 0 ;
    for i = 1:size(x1,2)
        if(x1(1,i) > v0)
            epsilon = epsilon + 1 ;
        end
        if(x2(1,i) <= v0)
            epsilon = epsilon + 1 ;
        end
    end
    epsilon = epsilon / (size(x1,2) + size(x2,2)) ;
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
best_alpha = best_v0 ;
best_error = best_epsilon ;
disp('best alpha: ');
disp(best_alpha);
disp('best error: ');
disp(best_error);


X1 = V.' * X1.' ;
X2 = V.' * X2.' ;


 scatter(X1, zeros(1,size(X1,2)),'b');
 hold on ;
 scatter(X2, zeros(1,size(X2,2)),'g');
 hold on ;
 m1 = mean(X1) ;
 s1 = std(X1) ;
 plot(0:0.01:3,normpdf(0:0.01:3,m1 , s1),'b') ;
 hold on;
 m2 = mean(X2) ;
 s2 = std(X2) ;
 plot(0:0.01:3,normpdf(0:0.01:3,m2 , s2),'g') ;
 hold on;
 