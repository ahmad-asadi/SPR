train_data = load('Iris_train.dat') ;
train_data = train_data(:,[2,5]) ;

test_data = load('Iris_test.dat') ;
test_data = test_data(:,[2,5]) ;

ind1 = 1 ;
ind2 = 1 ;
for i = 1 : size(train_data,1)
    if train_data(i,2) == 0
        train_data1(ind1 , :) = train_data(i,:) ;
        ind1 = ind1 + 1 ;
    elseif train_data(i,2) == 1
        train_data2(ind2 , :) = train_data(i,:) ;
        ind2 = ind2 + 1; 
    end
end

ind1 = 1 ;
ind2 = 1 ;
for i = 1 : size(test_data,1)
    if test_data(i,2) == 0
        test_data1(ind1 , :) = test_data(i,:) ;
        ind1 = ind1 + 1 ;
    elseif test_data(i,2) == 1
        test_data2(ind2 , :) = test_data(i,:) ;
        ind2 = ind2 + 1; 
    end
end


%%% Draw image histogram
ax = subplot(2,1,1);
feat_hist(train_data1,ax) ;
ax = subplot(2,1,2);
feat_hist(train_data2,ax) ;

%%% Estimating class priors
n = size(train_data1,1) + size(train_data2,1) ; 
p1 = size(train_data1,1) / n ;
p2 = 1 - p1 ;
fprintf('The prior probability of class 0 is %d and class 1 is %d\n' , p1 , p2) ;

%%% Estimating mean and variance of normal conditional densities
[m1, s1] = normfit(train_data1(:,1)) ;
fprintf('Conditional density class 0: mean = %d, variance = %d\n', m1, s1);
[m2, s2] = normfit(train_data2(:,1)) ;
fprintf('Conditional density class 1: mean = %d, variance = %d\n', m2, s2);

%%% Plotting the estimated class conditional diagrams
figure ;
X = 1:0.01:5 ;
Y1 = normpdf(X, m1, s1) ;
Y2 = normpdf(X, m2, s2) ;
plot(X,Y1,'b') ;
hold on ;
plot(X,Y2,'g') ;

%%% Plotting the posterior densities
figure;
PX = Y1 * p1 + Y2 * p2 ;
Y1 = (Y1 * p1) ./ PX ;
Y2 = (Y2 * p2) ./ PX ;
plot(X,Y1,'b') ;
hold on ;
plot(X,Y2,'g') ;

%%% train data confusion matrix
threshold = X(1,1) ;
for i = 1 : size(Y1,2) 
    if(Y2(1,i) > Y1(1,i))
        threshold = X(1,i) ;
    else
        break ;
    end
end
n1 = 0 ;
n2 = 0 ;
for i = 1 : size(train_data1,2)
    if(train_data1(i,1) > threshold)
            n1 = n1 + 1 ;
    end
end
for i = 1 : size(train_data2,2)
    if(train_data2(i,1) <= threshold)
            n2 = n2 + 1 ;
    end
end
disp('TRAIN SET CLASSIFICATION ERRORS:');
fprintf('the number of class 0 data predicted as class 1 is %d out of %d, error rate is %d\n',n1,size(train_data1,1),n1/size(train_data1,1)) ;
fprintf('the number of class 1 data predicted as class 0 is %d out of %d, error rate is %d\n',n2,size(train_data2,1),n2/size(train_data2,1)) ;
fprintf('the overall training data error is %d\n', (n1 + n2) / (size(train_data1,1) + size(train_data2,1))) ;

%%% test data confusion matrix
n1 = 0 ;
n2 = 0 ;
for i = 1 : size(test_data1,2)
    if(test_data1(i,1) > threshold)
            n1 = n1 + 1 ;
    end
end
for i = 1 : size(test_data2,2)
    if(test_data2(i,1) <= threshold)
            n2 = n2 + 1 ;
    end
end
disp('TEST SET CLASSIFICATION ERRORS:');
fprintf('the number of class 0 data predicted as class 1 is %d out of %d, error rate is %d\n',n1,size(train_data1,1),n1/size(train_data1,1)) ;
fprintf('the number of class 1 data predicted as class 0 is %d out of %d, error rate is %d\n',n2,size(train_data2,1),n2/size(train_data2,1)) ;
fprintf('the overall training data error is %d\n', (n1 + n2) / (size(train_data1,1) + size(train_data2,1))) ;

