Transition.m, Transition2.m are functions calculating transition matrix based on propensities and regulatory rules; 

x_generator.m is generation of left half of table for the regulatory rule; 

simple_fitness_sort.m is definition of fitness function ( difference ) for GA optimization; 

NoDelayGA.m is the optimization function for a defined regulatory network with fixed propensities; 

GA_SAA_MAIN.m is the main function of optimation; this file also gives visual output of pdf from different estimations; 

SendEmailFromMatlab.m is the function notifying user to collect data; PLEASE MAKE SURE THAT CHANGE EMAIL ADDRESS TO USER'S OWN EMAIL ADDRESS; 

Main_Jun14.m is simulation file; 

Jun15_concentration_plot.s use file that generated from Main_Jun14.m to plot activity of each element; PLEASE MAKE SURE TO CHANGE THE DATA FILE NAME; 

State.m is used to used in simulation for state calculation; 