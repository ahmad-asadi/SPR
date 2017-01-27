function error = KNN_LOO(D, L, K)
    error = 0 ;
    for i = 1 : size(D,1)
        X = D(i,:) ;
        dists = (repmat(X,size(D,1),1) - D).^2 ;
        dists(find(dists(:,3) ~= 0),3) = 1 ;
        dists(find(dists(:,7) ~= 0),7) = 1 ;
        dists(find(dists(:,13) ~= 0),13) = 1 ;
        dists = sum(dists.') ; 
        [~,sortedInds] = sort(dists,'ascend') ;
        knnLabels = L(sortedInds(2 : 2 + K),:) ;
        l = mode(knnLabels) ;
        if(l ~= L(i))
            error = error + 1 ;
        end
    end

    error = error / size(D,1) ;

end