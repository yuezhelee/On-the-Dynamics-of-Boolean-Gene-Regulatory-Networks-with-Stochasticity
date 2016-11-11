function f = x_generator(n)
if n == 2
    f = [0 0; 0 1; 1 0; 1 1 ]; 
else x0 = x_generator(n-1);
    x1 = size( x0, 1 ); 
    x2 = zeros( x1,1 );
    x3 = ones( x1, 1 ); 
    x4 = [ x2 x0 ];
    x5 = [ x3 x0 ];
    x6 = [ x4; x5 ];
    f = x6;
end
    
