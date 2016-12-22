function HO_Kashyap(Y)
iter = 1 ;
a = [0;0;0] ;
b = ones(20,1) * 1 ;
eta = 0.01 ;
b_min = ones(20,1) * 1;

a                 = (b.'*pinv(Y')).';
k	               = 0;
e    	           = 1e3;
found              = 0;
err = (sum(abs(e) > b_min)) ;
Max_iter = 100 ;
figure;
while (err>0 & (k < Max_iter))
    prev_err = err;
    k = k+1;

    e       = (Y * a) - b;
   
    e_plus  = 0.5*(e + abs(e));
   
    b       = b + 2*eta*e_plus;
    
    a =(b.'*pinv(Y')).';
    iter = iter + 1 ;
    disp(iter);
    err = (sum(abs(e) > b_min)) ;
    if(iter > 1)
        plot([iter - 1,iter] , [prev_err , err] , 'r') ;
        hold on ;
        title('Ho-Kashyap') ;
        ylabel('misclassifications') ;
        xlabel('iteration') ;
        drawnow;
    end
end









