function y = simple_fitness_sort( x, F0, F1, p_input )
global k N;
alpha = x(1);
beta = x(2);
n = max(size(p_input));

P_0 =  Transition( n, p_input, F0 , F1 );

p0 =  betarnd( alpha, beta, [2 n] ) ;


P = Transition( n, p0, F0 , F1 );

y1 = sort( reshape( P_0, [(2^n)^2 1] ) ); 
y2 = sort( reshape( P, [(2^n)^2 1] ) ); 

y = (sum( sum( (y1 - y2).^2 ) )/ ( 2^n )^2)^(1/4);



