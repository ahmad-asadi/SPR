X = zeros(100,3);
X(:,1) = normrnd(1, 0.5, 100,1);
X(:,2) = normrnd(1, 1, 100,1);
X(:,3) = normrnd(1, 2, 100,1);

histogram(X(:,1));
figure;

histogram(X(:,2));
figure;

histogram(X(:,3));
