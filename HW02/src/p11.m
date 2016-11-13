train_data = load('Iris_train.dat') ;
train_data = train_data(:,[2,5]) ;

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

feat_hist(train_data1) ;
feat_hist(train_data2) ;

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

function feat_hist(train_data)

    binrange = 1:0.2:5 ;
    [bins] = histc(train_data(:,1),binrange);

    figure;
    bar(binrange, bins, 'histc') ;

end
