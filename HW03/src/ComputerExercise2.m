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

W2 = [
    7.1 4.2
    -1.4 -4.3
    4.5 0
    6.3 1.6
    4.2 1.9
    1.4 -3.2
    2.4 -4
    2.5 -6.1
    8.4 3.7
    4.1 -2.2
    ];
% Adding bias components
W2 = [W2, repmat([1], size(W2,1),1)] ;
% Negating samples from the second class
W2 = -W2;


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

a = [0;0;0] ;
eta = 0.01 ;
iter = 1 ;
error_threshold = 0.01;
error_rate = 1 ;

figure;
while(abs(error_rate) > error_threshold & iter < 300)
    t = a.'*[W1.',W2.'] ;
    prev_error_rate = error_rate;
    error_rate = (size(t(t<0),2))/(size(W1,1)+size(W2,2)) ;
    Y = zeros(1,3);
    ind = 1 ;
    for i = 1 : size(W1,1)
        if(a.' * W1(i,:).' <= 0)
            Y(ind,:) = W1(i,:) ;
            ind = ind + 1 ;
        end
    end
    for i = 1 : size(W2,1)
        if(a.' * W2(i,:).' <= 0)
            Y(ind,:) = W2(i,:) ;
            ind = ind + 1 ;
        end
    end
    error_rate = size(Y,1) / 20 ;
    a = a + sum(eta * Y).' ;
    iter = iter + 1 ;
    if(iter > 1)
        plot([iter-1,iter] , [prev_error_rate , error_rate] , 'r');
        hold on ;
        drawnow ;
        title('Basic Perceptron');
        ylabel('number of misclassified samples') ;
        xlabel('iteration');    
    end
end


a = [0;0;0] ;
eta = 0.01 ;
iter = 1 ;
error_threshold = 0.00001;
error_rate = 1 ;

W2 = -W2 ;
W3 = -W3 ;


% 
figure;
while(abs(error_rate) > error_threshold& iter < 300)
    t = a.'*[W3.',W2.'] ;
    prev_error_rate = error_rate;
    error_rate = (size(t(t<0),2))/(size(W3,1)+size(W2,2)) ;
    Y = zeros(3,1).';
    ind = 1 ;
    for i = 1 : size(W3,1)
        if(a.' * W3(i,:).' <= 0)
            Y(ind,:) = W3(i,:) ;
            ind = ind + 1 ;
        end
    end
    for i = 1 : size(W2,1)
        if(a.' * W2(i,:).' <= 0)
            Y(ind,:) = W2(i,:) ;
            ind = ind + 1 ;
        end
    end
    error_rate = size(Y,1) / 20 ;
    a = a + sum(eta * Y).' ;
    iter = iter + 1 ;
    if(iter > 1)
        plot([iter-1,iter] , [prev_error_rate , error_rate] , 'r');
        hold on ;
        drawnow ;
        title('Basic Perceptron');
        ylabel('number of misclassified samples') ;
        xlabel('iteration');    
    end
end





