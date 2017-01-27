function F = KNN_Density(D, K , X1Range , X2Range)
    F = zeros(size(X1Range,2) , size(X2Range,2)) ;
    for i = 1 : size(X1Range,2)
        for j = 1 : size(X2Range,2)
            if(size(D,2) == 1)
                X = X1Range(i);
            else
                X = [X1Range(i) , X2Range(j)] ;
            end
            dists = (repmat(X,size(D,1),1) - D).^2 ;
            if(size(D,2) == 2)
                dists = sum(dists.') ;
            end
            [~,sortedInds] = sort(dists,'ascend') ;
            if(dists(1) == 0)
                R = mean(dists(sortedInds(2:K + 1))) ;
            else
                R = mean(dists(sortedInds(2:K + 1))) ;
            end
            A = R^2 * pi ;
            if(K > 1)
                F(i,j) = (K-1)/(size(D,1)*A)  ;
            else
                F(i,j) = (K)/(size(D,1)*A)  ;
            end
        end
    end
    F = F ./ sum(sum(F));
end