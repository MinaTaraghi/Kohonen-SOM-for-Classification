# Kohonen SOM for Classification
 Kohonen Self Organizing Map for Classification
 
The dataset used is UCI's "Wine" dataset that can be found here:
https://archive.ics.uci.edu/ml/datasets/Wine

There are a number of parameters and options that can be decided on by the user through the GUI:
 - The dimensionality of the Map (1-D, 2-D, 3-D, and the size of each dimension)
 - The neighbouring of the map: 1-D (Radial). 2-D (Radial, Rectangular, Hexagonal). 3-D (Radial). or Neighbourhood Gaussian kernel for all dimensionalities
 - The radius size
 - Distance type (Euclidean, Cosine)
 - Maximum number of epochs (for Ordering and Convergence phases separately)
 - The DeSieno Update Rule Parameters (According to: DeSieno, Duane. "Adding a conscience to competitive learning." In IEEE international conference on neural networks, vol. 1, no. 6, pp. 117-124. New York: Institute of Electrical and Electronics Engineers, 1988.)
  (Beta=B, Gamma=C)
  - Gaussian Neighbourhood Kernel Annealing Parameter (Sigma0 and T1=1000/log(sigma0) where sigma=sigma0 * exp(-n/T1))
  - Learning rate Annealing Parameters (T2 and Eta=Eta0=initial Learning Rate, where Eta(n)=Eta0 * exp(-n/T2))
The Umatrix (Unified Distance Matrix-The Neighbouring Neurons Weights Distance Matrix) is plotted on the left
The Dead Neurons Number for iterations is plotted on the right
Number of Final CLusters and minimum number of dead neurons are also displayed
The Matrix showing neurons and their winning records is also displayed
Finally The weights for each input is plotted using colormap
