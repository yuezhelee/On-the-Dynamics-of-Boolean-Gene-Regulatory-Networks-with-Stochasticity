# On-the-Dynamics-of-Boolean-Gene-Regulatory-Networks-with-Stochasticity

To find out more about these codes, see 
Akman, O., Comar, T., Harris, A. L., Hrozencik, D., \& Li, Y. "Dynamics of Gene Regulatory Networks with Stochastic Propensities." International Journal of Biomathematics (2018).

Abstract: 
Gene regulatory networks (GRNs) control the production of proteins in cells. It is well-known that this process is not deterministic. Numerous studies employed a non- deterministic transition structure to model these networks. However, it is not realistic to expect state-to-state transition probabilities to remain constant throughout an organ- ism’s lifetime. In this work, we focus on modeling GRN state transition (edge) variability using an ever-changing set of propensities. We suspect that the source of this variation is due to internal noise at the molecular level and can be modeled by introducing addi- tional stochasticity into GRN models. We employ a beta distribution, whose parameters are estimated to capture the pattern inherent in edge behavior with minimum error. Additionally, we develop a method for obtaining propensities from a pre-determined network.


Keywords: Molecular noise; network simulation; beta distribution.


Or you can also see my master thesis here: 
http://ir.library.illinoisstate.edu/etd/518/

This is the MATLAB source codes that solely written by me.
All the source files are written under MATLAB 2014a. 
It has been observed that some of them cannot be run at MATLAB 2016a or MATLAB 2016b. 
 
This part of code contains 3 parts: 
part 1: how to calculate transition matrix through propensity matrix
part 2: how to use SAA nested GA to estimate parameters in the beta distribution (tuned)
part 3: how to do simulation and visualization
