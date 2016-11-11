function f = visual_and_hamming(type)
% requires loading at least one of the following: 
% load('MLE_low.mat')
% load('GA_low.mat')
str1 = 'MLE_';
str2 = 'GA_';
str3 = '.mat';
f1 = [str1, type,str3]; % for MLE data;
f2 = [str2, type, str3];% for GA data; 
% the simulation for both data

load(f1)
n = 4;
N = max(size(r1));
x = x_generator(n);
for i = 1:N
    p53(i) = x(r1(i),1); dam(i) = x(r1(i),2); mc(i) = x(r1(i),3); mn(i) = x(r1(i),4);
end
y{1} = [p53;dam;mc;mn];
clear p53 dam mc mn i;
for i = 1:N
    p53(i) = x(r2(i),1); dam(i) = x(r2(i),2); mc(i) = x(r2(i),3); mn(i) = x(r2(i),4);
end
y{2} = [p53;dam;mc;mn];
clear p53 dam mc mn i r1 r2;

load(f2)
for i = 1:N
    p53(i) = x(r1(i),1); dam(i) = x(r1(i),2); mc(i) = x(r1(i),3); mn(i) = x(r1(i),4);
end
y{3} = [p53;dam;mc;mn];
clear p53 dam mc mn i;
for i = 1:N
    p53(i) = x(r2(i),1); dam(i) = x(r2(i),2); mc(i) = x(r2(i),3); mn(i) = x(r2(i),4);
end
y{4} = [p53;dam;mc;mn];
clear r1 r2 p53 dam mc mn i ;

%% visualization
figure
set(gcf, 'color',[1 1 1]);
subplot(4,1,1)
plot(y{1}(1,:),'k:'); hold on;  plot(y{2}(1,:),'m--'); plot(y{3}(1,:),'b-.'); plot(y{4}(1,:),'g-');
axis([0 N 0 2]); xlabel('generation'), ylabel('p53 concentration')
legend('propensities','MLE based on propensities','propensities','Engineered GA');

subplot(4,1,2)
plot(y{1}(2,:),'k:'); hold on; plot(y{2}(2,:),'m--'); plot(y{3}(2,:),'b-.'); plot(y{4}(2,:),'g-');
axis([0 N 0 2]); xlabel('generation'), ylabel('DNA Damage')
legend('propensities','MLE based on propensities','propensities','Engineered GA');

subplot(4,1,3)
plot(y{1}(3,:),'k:'); hold on; plot(y{2}(3,:),'m--'); plot(y{3}(3,:),'b-.'); plot(y{4}(3,:),'g-');
axis([0 N 0 2]); xlabel('generation'), ylabel('cytosolic Mdm2')
legend('propensities','MLE based on propensities','propensities','Engineered GA');

subplot(4,1,4)
plot(y{1}(4,:),'k:'); hold on; plot(y{2}(4,:),'m--'); plot(y{3}(4,:),'b-.'); plot(y{4}(4,:),'g-');
axis([0 N 0 2]); xlabel('generation'), ylabel('nuclear Mdm2')
legend('propensities','MLE based on propensities','propensities','Engineered GA');

%% calculate Hamming distance between these two sequence of simulation
for i = 1:4
    each_node = [y{1}(i,:);y{2}(i,:);y{3}(i,:);y{4}(i,:)]; % 4 different simulation
    Hamm(i,:) = pdist(each_node, 'hamming'); 
end
f = Hamm;
% Hamm: row: each node distance from each simulation
% column compare the simulation
% column 2 as a reference, as it is simulation under same optimization condition (should be the smallest, or close to the smallest)
% column 1: (2,1) fixed & MLE
% column 2: (3,1) fixed & fixed
% column 3: (4,1) fixed & GA
% column 4: (3,2) fixed & MLE
% column 5: (4,2) GA & MLE
% column 6: (4,3) fixed & GA