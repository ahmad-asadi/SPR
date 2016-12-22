W1 = [
    0.1 101
    6.8 7.1
    -3.5 -4.1
    2 2.7
    4.1 2.8
    3.1 5
    -0.8 -1.3
    0.9 1.2
    5 6.4
    3.9 4
    ] ;
% Adding bias components
W1 = [W1, repmat([1] , size(W1,1),1)];

W3 = [
    -3 -2.9
    0.5 8.7
    2.9 2.1
    -0.1 5.2
    -4 2.2
    -1.3 3.7
    -3.4 6.2
    -4.1 3.4
    -5.1 1.6
    1.9 5.1
    ];

% Adding bias components
W3 = [W3, repmat([1] , size(W3,1),1)];
% Negating all samples of the second class
W3 = -W3;

% Basic Gradient Descent
a = [1;1;1] ;
eta = 0.01 ;
iter = 1 ;
error_threshold = 0.00001;
criterion = @(a)(a.'*a) ;
derivative_of_criterion = @(a)(a) ;

figure;
criterion_values(1) = criterion(a) ;
while(abs(eta * criterion(a)) > error_threshold)
    a = a - eta * derivative_of_criterion(a) ;
    iter = iter + 1;
    criterion_values(iter) = criterion(a) ;
    if(iter > 1)
        plot([iter-1,iter] , [criterion_values(iter-1) , criterion_values(iter)] , 'r');
        hold on ;
        drawnow ;
        title('Basic Gradient');
        ylabel('criterion function value (|a|^2)') ;
        xlabel('iteration');    
    end
end

   eta = 0.001 ;
   fprintf('convergence:%d\n' , perceptron(eta , W1 , -W3 , 1) ) ;

ind = 1 ;
etaRange = 0.01 : 0.1 : 10;
for eta = etaRange
   conv(ind) = perceptron(eta , W1 , W3 , 0)  ;
   ind = ind + 1 ;
end
figure;
plot(etaRange , conv) ;


