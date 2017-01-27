X = [0 0
    0 2
    2 0
    2 2
    1 1
    4 0
    6 0
    5 1
    4 2
    6 2] ;
Y = [1
    1
    0
    0
    1
    0
    0
    0
    0
    0] ;
for i = 1 : size(X,1)
    if(Y(i) == 1)
        scatter(X(i,1),X(i,2),'+','b') ;
        hold on ;
    else
        scatter(X(i,1),X(i,2),'*','r') ;
        hold on ;
    end    
end
axis([-1 7 -1 3]) ;
hold off;