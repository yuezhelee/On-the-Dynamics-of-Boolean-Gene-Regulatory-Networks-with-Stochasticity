function f = NoDelayGA( n, p_input, F0, F1, N , y) 

for k = 1: N
    %% initialization
    trans = Transition ( n, p_input ,F0,F1 );
    alphabeta = betafit( reshape( trans, [ 1, (2^n)^2 ] ) ); 
    %% optimization
    ObjectiveFunction = @(x)simple_fitness_sort(x, F0, F1, p_input);
    nvars = 2;    % Number of variables
    LB = [0 0];   % Lower bound
    UB = [40 40];  % Upper bound
%    ConstraintFunction = @(x)simple_constraint;
    options = gaoptimset('PopulationSize',200);
    options = gaoptimset( options,'MutationFcn',@mutationadaptfeasible);
%    options = gaoptimset(options, 'MutationFcn', {@mutationgaussian, 4, 4} );
%    options = gaoptimset( options, 'MutationFcn', {@mutationuniform, .3} );    
    X0 = alphabeta;     
    options = gaoptimset(options,'InitialPopulation',X0);
    options = gaoptimset(options,'FitnessLimit',y(5));
    options = gaoptimset(options,'TolCon',y(3));
    options = gaoptimset(options,'TolFun',y(4));
    options = gaoptimset(options,'Generations',2000,'StallGenLimit', 1000);
    options = gaoptimset(options, 'SelectionFcn',@selectiontournament );
    options = gaoptimset(options, 'FitnessScalingFcn', {@fitscalingshiftlinear, y(2)} );
    options = gaoptimset(options, 'CrossoverFcn', {@crossoverintermediate, y(1) } );
%    options = gaoptimset(options, 'PlotFcns',{@gaplotbestf,@gaplotstopping} );
%    options = gaoptimset(options,  );
%    [x(k,:),fval(k)] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB, ConstraintFunction,options);
    [x(k,:),fval(k)] = ga(ObjectiveFunction,nvars,[],[],[],[],LB,UB, [],options);
    clear ObjectiveFunction nvars LB UB ConstraintFunction  options X0 ;
end
clear k;
k = find( fval == min(fval) );
% x(k,:)
f = [ x(k,:),fval(k) ] 