%p = [.1 .5; .2 .9]; x = [0 0; 0 1; 1 0; 1 1];f = [ 0 0; 1 0; 0 1; 1 0 ];
function F = Transition2( p, x , f )
% x = [ x1 | x2 ];
% f = [ f1 | f2 ];
% p = [ p1 p3; p2 p4 ];
m1 = size( x,2 ); % number of genes that are involved;
m2 = size( x,1 ); % listed combination; m2 = 2^m1 = 4; 
P = zeros( m2, m2 );
for i = 1:m2 
    if x(i,1) < f(i,1)
        if x(i,2) < f( i,2 )
            P(i,1) = ( 1-p(1,1) )*( 1-p(1,2) );
            P(i,2) = ( 1-p(1,1) )*p(1,2);
            P(i,3) = p(1,1)*( 1-p(1,2) );
            P(i,4) = p(1,1)*p(1,2);
        else if x(i,2) > f(i,2)
                P(i,1) = ( 1-p(1,1) )  * p(2,2);
                P(i,2) = ( 1-p(1,1) )*( 1-p(2,2) );
                P(i,3) = p(1,1)*p(2,2);
                P(i,4) = p(1,1)*( 1-p(2,2) );
            else % x(i,2) == f(i,2)
                if x(i,2) == 0
                    P(i,1) = 1-p(1,1);
                    P(i,3) = p(1,1);
                else % x(i,2) == 1
                    P(i,2) = 1-p(1,1);
                    P(i,4) = p(1,1);
                end
            end
        end
    else if x(i,1) > f(i,1)
            if x(i,2) < f(i,2)
                P(i,1) = p(2,1) * ( 1-p(1,2) );
                P(i,2) = p(2,1) * p(1,2);
                P(i,3) = ( 1-p(2,1) ) * ( 1-p(1,2) );
                P(i,4) = ( 1-p(2,1) ) * p(1,2); 
            else if x(i,2) > f(i,2)
                    P(i,1) = p(2,1) * p(2,2);
                    P(i,2) = p(2,1) * ( 1-p(2,2) );
                    P(i,3) = ( 1-p(2,1) ) * p(2,2);
                    P(i,4) = ( 1-p(2,1) ) * ( 1-p(2,2) );
                else % x(i,2) == f(i,2)
                    if x(i,2) == 0
                        P(i,1) = p(2,1);
                        P(i,3) = 1-p(2,1);
                    else % x(i,2) == 1
                        P(i,2) = p(2,1);
                        P(i,4) = 1-p(2,1);
                    end
                end
            end
        else % x(i,1) == f(i,1)
            if x(i,1) == 0
                if x(i,2) < f(i,2)
                    P(i,1) = 1-p(1,2);
                    P(i,2) = p(1,2);
                else if x(i,2) > f(i,2)
                        P(i,1) = p(2,2);
                        P(i,2) = 1-p(2,2);
                    else % x(i,2) == f(i,2)
                        if x(i,2) == 0
                            P(i,1) = 1;
                        else % x(i,2) == 1
                            P(i,2) = 1;
                        end
                    end
                end
            else %x(i,1) == 1
                if x(i,2) < f(i,2)
                    P(i,3) = 1-p(1,2);
                    P(i,4) = p(1,2);
                else if x(i,2) > f(i,2)
                        P(i,3) = p(2,2);
                        P(i,4) = 1-p(2,2);
                    else % x(i,2) == f(i,2)
                        if x(i,2) == 0
                            P(i,3) = 1;
                        else % x(i,2) == 1
                            P(i,4) = 1;
                        end
                    end
                end
            end
        end
    end
end
F=P;