function F = State ( P, s )
% P for transition matrix
% s for enter entry number
% char for the purpose of changing which path of simulation goes; 
n = log( max(size(P)) )/log(2);
    for i = 1:2^n
        R(1,i) = sum( P(s, 1:i) );
    end
i = 1; r = rand*0.98+0.01; 
    while i<2^n+1
        if R(1,1) > r 
            F = 1;
            break;
        else if ( R(1,i) <= r )&&( R(1,i+1) >= r )
            F = i;
            break;
            else i = i+1;
            end
        end
    end