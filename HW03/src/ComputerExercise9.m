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
W3 = -W3;

W4=[
    -2 -8.4
    -8.9 0.2
    -4.2 -7.7
    -8.5 -3.2
    -6.7 -4
    -0.5 -9.2
    -5.3 -6.7
    -8.7 -6.4
    -7.1 -9.7
    -8 -6.3
    ];
W4 = [W4, repmat([1] , size(W4,1),1)];

Y                  = [W1;W3];
Ho_Kashyap(Y) ;

Y                  = [W2;W4];
Ho_Kashyap(Y) ;
