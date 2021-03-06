X = 0 :0.01: 5 ;
Y1 = zeros(size(X,1), size(X,2)) ;
Y2 = zeros(size(X,1), size(X,2)) ;
Y3 = zeros(size(X,1), size(X,2)) ;
for i = 1 : size(Y1 , 2)
    if(X(1,i) >= 2 && X(1,i) <= 4)
        Y1(1,i) = 0.25;
        Y3(1,i) = 0.5 * exp(-(X(1,i))) ;          
    end
    Y2(1,i) = 0.5 * exp(-(X(1,i))) ;
    
end

h = area(X,Y1) ;
h(1).FaceColor = [1 1 0] ;
hold on ;
h = area(X,Y2) ;
h(1).FaceColor = [0 1 1] ;
hold on ;
h = area(X,Y3) ;
h(1).FaceColor = [1 0 1] ;
hold on ;

figure ;
X = 0 :0.1: 25 ;
Y1 = zeros(size(X,1), size(X,2)) ;
Y2 = zeros(size(X,1), size(X,2)) ;
Y3 = zeros(size(X,1), size(X,2)) ;
Y4 = zeros(size(X,1), size(X,2)) ;
for i = 1 : size(Y1 , 2)
    if(X(1,i) >= 2 && X(1,i) <= 22)
        Y1(1,i) = 1/40;
        Y3(1,i) = 0.5 * exp(-(X(1,i))) ;          
        if(Y1(1,i) < Y3(1,i))
            Y4(1,i) = Y1(1,i) ;
            Y1(1,i) = 0;
            Y3(1,i) = 0;
        end
    end
    Y2(1,i) = 0.5 * exp(-(X(1,i))) ;
    
end

h = area(X,Y1) ;
h(1).FaceColor = [1 1 0] ;
hold on ;
h = area(X,Y2) ;
h(1).FaceColor = [0 1 1] ;
hold on ;
h = area(X,Y3) ;
h(1).FaceColor = [1 0 1] ;
hold on ;
h = area(X,Y4) ;
h(1).FaceColor = [1 0 0] ;
hold on ;


