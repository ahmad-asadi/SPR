function F = parzen(D , H , kernel , X1Range , X2Range)
    F = zeros(size(X1Range,2) , size(X2Range,2)) ;
    for X1 = 1 : size(X1Range,2)
        for X2 = 1 : size(X2Range,2)
            for k = 1 : size(D,1)
                if(size(D,2) == 1)
                    X = X1Range(X1) ;
                else
                    X = [X1Range(X1) X2Range(X2)] ;
                end
                F(X1, X2) = F(X1, X2) + kernel(X - D(k,:)) ;
            end
        end        
    end
    F = (1/(size(D,1) * (H^(size(D,2))))) * F ;
end