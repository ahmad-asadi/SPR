function feat_hist(train_data,ax)
    binrange = 1:0.2:5 ;
    [bins] = histc(train_data(:,1),binrange);
    bar(ax, binrange, bins, 'histc') ;
end
