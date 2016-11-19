clc,clear
%% generate data for plot section
n = 4; N = 400;
F0 = x_generator(n);
% F1 = 0.5*sign( rand( [2^n,n] ) - 0.5*ones(2^n,n) ) + 0.5 * ones(2^n,n);
F1 = [1 0 0 1; 0 0 0 1; 1 0 0 1; 0 0 0 1; 1 1 0 0; 0 1 0 0; 1 1 0 1; 0 1 0 1; 1 0 1 0; 0 0 1 0; 1 0 1 1; 0 0 1 1; 1 1 1 0; 0 1 1 0; 1 1 1 1; 0 1 1 1];

%% low propensity
p_input =  [ linspace(0.2, 0.3, n); linspace(0.3, 0.4, n) ];
alphabeta = [ 5 39 ];
mle = state_simul(n, N, F1, p_input, 'ML', alphabeta);
r1 = mle{1};
r2 = mle{2};
save('MLE_low.mat', 'r1','r2');
clear mle r1 r2;
ga = state_simul(n, N, F1, p_input, 'GA', alphabeta);
r1 = ga{1};
r2 = ga{2};
save('GA_low.mat','r1','r2');
clear ga r1 r2 p_input alphabeta;

%% high propensity
p_input = [ linspace(0.7, 0.8, n); linspace(0.8, 0.9, n) ];
alphabeta = [ 39 9 ];
mle = state_simul(n, N, F1, p_input, 'ML', alphabeta);
r1 = mle{1};
r2 = mle{2};
save('MLE_high.mat', 'r1','r2');
clear mle r1 r2;
ga = state_simul(n, N, F1, p_input, 'GA',alphabeta);
r1 = ga{1};
r2 = ga{2};
save('GA_high.mat','r1','r2');
clear ga r1 r2 p_input alphabeta;

%% medium propensity
p_input = [ linspace(0.4, 0.5, n); linspace(0.5, 0.6, n) ];
alphabeta = [ 36.82 36.58 ];
mle = state_simul(n, N, F1, p_input, 'ML', alphabeta);
r1 = mle{1};
r2 = mle{2};
save('MLE_medium.mat', 'r1','r2');
clear mle r1 r2;
ga = state_simul(n, N, F1, p_input, 'GA', alphabeta);
r1 = ga{1};
r2 = ga{2};
save('GA_medium.mat','r1','r2');
clear ga r1 r2 p_input alphabeta;

%% spread propensity
p_input = [ linspace(0.1, 0.2, n); linspace(0.8, 0.9, n) ];
alphabeta = [ 8.04 39.34 ];
mle = state_simul(n, N, F1, p_input, 'ML', alphabeta);
r1 = mle{1};
r2 = mle{2};
save('MLE_spread.mat', 'r1','r2');
clear mle r1 r2;
ga = state_simul(n, N, F1, p_input, 'GA', alphabeta);
r1 = ga{1};
r2 = ga{2};
save('GA_spread.mat','r1','r2');
clear ga r1 r2 p_input alphabeta;