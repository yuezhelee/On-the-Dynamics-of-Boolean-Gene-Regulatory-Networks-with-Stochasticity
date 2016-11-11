clc,clear
%% Some notes for Hamming distance 
% column compare the simulation
% column 2 as a reference, as it is simulation under same optimization condition (should be the smallest, or close to the smallest)
% column 1: (2,1) fixed & MLE
% column 2: (3,1) fixed & fixed
% column 3: (4,1) fixed & GA
% column 4: (3,2) fixed & MLE
% column 5: (4,2) GA & MLE
% column 6: (4,3) fixed & GA

%% low propensities

low = visual_and_hamming('low')

%% high propensities

high = visual_and_hamming('high')


%% medium propensities

medium = visual_and_hamming('medium')

%% spread propensities

spread = visual_and_hamming('spread')
