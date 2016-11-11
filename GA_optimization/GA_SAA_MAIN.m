clc,clear

N = 1; 
n = 4;

F0 = x_generator(n);
% F1 = 0.5*sign( rand( [2^n,n] ) - 0.5*ones(2^n,n) ) + 0.5 * ones(2^n,n); 
 F1 = [1 0 0 1; 0 0 0 1; 1 0 0 1; 0 0 0 1; 1 1 0 0; 0 1 0 0; 1 1 0 1; 0 1 0 1; 1 0 1 0; 0 0 1 0; 1 0 1 1; 0 0 1 1; 1 1 1 0; 0 1 1 0; 1 1 1 1; 0 1 1 1];

datestr(now, 'HHMMmmmdd');
y = [0.969446298529027   9.752274683612075   0.00000156316794638   0.000000000000819160139092 0.00000005702976424];
% y= [ @crossoverintermediate @fitscalingshiftlinear 'TolCon' 'TolFun' 'FitnessLimit' ];
p_low = [ linspace(0.01, 0.1, n); linspace(0.1, 0.2, n) ];
p_high = [ linspace(0.7, 0.8, n); linspace(0.8, 0.9, n) ];
p_medium = [ linspace(0.4, 0.5, n); linspace(0.5, 0.6, n) ];
p_spread = [ linspace(0.1, 0.2, n); linspace(0.8, 0.9, n) ];

output(1,:) = NoDelayGA( n, p_low, F0, F1, N, y );

output(2,:) = NoDelayGA( n, p_high, F0, F1, N, y );

output(3,:) = NoDelayGA( n, p_medium, F0, F1, N, y );

output(4,:) = NoDelayGA( n, p_spread, F0, F1, N, y );


savefile = datestr(now, 'HHMMmmmdd');
save(savefile, 'output', 'F1');

% this is the part for visualization 

ab(1,:) = betafit( reshape(p_low, [1 2*n]) );
ab(2,:) = output(1, 1:2);
ab(3,:) = betafit( reshape(p_high, [1 2*n]) );
ab(4,:) = output(2, 1:2);
ab(5,:) = betafit( reshape(p_medium, [1 2*n]) );
ab(6,:) = output(3, 1:2); 
ab(7,:) = betafit( reshape(p_spread, [1 2*n]) );
ab(8,:) = output(4, 1:2);


sub_title{1} = 'low propensities';
sub_title{2} = 'high propensities';
sub_title{3} = 'medium propensities';
sub_title{4} = 'spread propensities';

figure
set(gcf, 'color','w')
for i = 1:4
    subplot(2,2,i)
    x = linspace(0,1,1000);
    y1 = betapdf(x, ab(2*i-1, 1), ab(2*i-1, 2) );
    y2 = betapdf(x, ab(2*i, 1), ab(2*i, 2) );
    plot( x, y1, 'b--', 'LineWidth',1 );
    hold on
    plot( x, y2, 'r', 'LineWidth',2 );
    hold off
    legend( 'MLE of Propensities', 'Engineered GA Estimation' );
    title( sub_title{i} );
    xlabel('Domain of \beta distribution'), ylabel('Probability density')
end



% SendEmailFromMatlab ( 'farochechouart@gmail.com' )
