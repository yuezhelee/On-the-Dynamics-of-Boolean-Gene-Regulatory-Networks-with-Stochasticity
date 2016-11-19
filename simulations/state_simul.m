function f = state_simul(n, N, F1, p_input, method, alphabeta)
F0 = x_generator(n);
trans = Transition ( n, p_input ,F0,F1 );

r1(1,1) = randi( 2^n, 1 ); % initial state
r2 = r1;

for i = 2:N
    r1(1,i) = State ( trans, r1(1,i-1) );
end

%% MLE simulaton 
if method == 'ML'
    ab = betafit( reshape( p_input, [1 2*n] ) );
    p0 = sort( betarnd( ab(1), ab(2), [1 2*n] ) );
    p1 = [ p0(1:n); p0(n+1:2*n) ];
    Prand = Transition ( n, p1, F0 , F1 );
    for i = 2:N
        r2(1,i) = State ( Prand, r2(1,i-1) );
    end
%% GA simulation
else % method == 'GA'
    for i = 2:N
        r1(1,i) = State ( trans, r1(1,i-1) );
    end
    p0 = sort( betarnd( alphabeta(1), alphabeta(2), [1 2*n] ) );
    p1 = [ p0(1:n); p0(n+1:2*n) ];
    Prand = Transition ( n, p1, F0 , F1 );
    for i = 2:N
        r2(1,i) = State ( Prand, r2(1,i-1) );
    end
end

f{1} = r1;
f{2} = r2;




