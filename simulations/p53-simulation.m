clc,clear

n = 4; N = 400;
F0 = x_generator(n);
% F1 = 0.5*sign( rand( [2^n,n] ) - 0.5*ones(2^n,n) ) + 0.5 * ones(2^n,n);
F1 = [1 0 0 1; 0 0 0 1; 1 0 0 1; 0 0 0 1; 1 1 0 0; 0 1 0 0; 1 1 0 1; 0 1 0 1; 1 0 1 0; 0 0 1 0; 1 0 1 1; 0 0 1 1; 1 1 1 0; 0 1 1 0; 1 1 1 1; 0 1 1 1];
 
%p_input =  [ linspace(0.2, 0.3, n); linspace(0.3, 0.4, n) ];  alphabeta = [ 5 39 ]; % low
%p_input = [ linspace(0.7, 0.8, n); linspace(0.8, 0.9, n) ]; alphabeta = [ 39 9 ]; % high ;
%p_input = [ linspace(0.4, 0.5, n); linspace(0.5, 0.6, n) ];alphabeta = [ 36.82 36.58 ]; % medium ;
p_input = [ linspace(0.1, 0.2, n); linspace(0.8, 0.9, n) ]; alphabeta = [ 8.04 39.34 ]; % spread ;


trans = Transition ( n, p_input ,F0,F1 );

r1(1,1) = randi( 2^n, 1 ); % initial state
r2 = r1;

for i = 2:N
    r1(1,i) = State ( trans, r1(1,i-1) );
end

alphabeta = betafit( reshape( p_input, [1 2*n] ) );
p0 = sort( betarnd( alphabeta(1), alphabeta(2), [1 2*n] ) );
p1 = [ p0(1:n); p0(n+1:2*n) ];
Prand = Transition ( n, p1, F0 , F1 );
for i = 2:N
    r2(1,i) = State ( Prand, r2(1,i-1) );
end

figure
set(gcf,'color',[1 1 1])
subplot(1,2,1)
plot( r1, 'rs--' )
hold on
plot( r2, 'b<:' )
hold off
legend( 'fixed transition matrix', 'random transition matrix' )
xlabel( 'generation' ), ylabel( 'state number' )
title('estimation based on MLE from propensities')

% save( 'MLE.mat','r1', 'r2' )


subplot(1,2,2)
for i = 2:N
    r1(1,i) = State ( trans, r1(1,i-1) );
end
 
p0 = sort( betarnd( alphabeta(1), alphabeta(2), [1 2*n] ) );
p1 = [ p0(1:n); p0(n+1:2*n) ];
Prand = Transition ( n, p1, F0 , F1 );
for i = 2:N
    r2(1,i) = State ( Prand, r2(1,i-1) );
end
plot( r1, 'rs--' )
hold on
plot( r2, 'b<:' )
hold off
legend( 'fixed transition matrix', 'random transition matrix' )
xlabel( 'generation' ), ylabel( 'state number' )
title('estimation from transition matrix based on engineered GA')

% save( 'GA.mat','r1', 'r2' )



