function [conv ,a , error_rate] = perceptron(eta, W1, W3,plotCriterion)
a = [1;1;1] ;
iter = 1 ;
error_threshold = 0;
error_rate = 1 ;
misclassified = 0 ;
conv = 0 ;
prev_error_rate = [1];
if(plotCriterion==1)
    figure;
end
while(abs(error_rate) > error_threshold & (iter < 400))
    iter = iter + 1 ;
    error_rate = 0 ;
    for i = 1 : size(W1,1)
        t = a.'*W1(i,:).' ;
        y = zeros(1,3) ;
        if(t <= 0)
            misclassified = misclassified + 1 ;
            y = W1(i,:) ;
            error_rate = error_rate + 1/(size(W1,1) + size(W3,1)) ;
        end
        a = a + eta * y.' ;
    end
    for i = 1 : size(W3,1)
        t = a.'*W3(i,:).' ;
        y = zeros(1,3) ;
        if(t > 0)
            misclassified = misclassified + 1 ;
            y = W3(i,:) ;
            error_rate = error_rate + 1/(size(W1,1) + size(W3,1)) ;
        end
        a = a + eta * y.' ;
    end
        prev_error_rate = [prev_error_rate, error_rate];
        if(iter > 1 & (plotCriterion == 1))
            plot([iter-1,iter] , [prev_error_rate(iter-1) , error_rate] , 'r');
            hold on ;
            drawnow ;
            title('Basic Perceptron');
            ylabel('number of misclassified samples') ;
            xlabel('iteration');    
        end
    
end

disp(misclassified)
