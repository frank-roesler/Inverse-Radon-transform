# Inverse-Radon-transform
The Radon transform is a mathematical mapping that has important applications in medical physics. Specifically, the inverse of this transform is used to reconstruct X-Ray images from the raw intensity data. The input to the function is a so-called [sinogram](https://en.wikipedia.org/wiki/Radon_transform), which contains all the necessary information to reconstruct the original image. The output is the reconstructed image.

A demo script is included, which tests the function on a phantom. One can see that decreasing the number of measured anglesin the forward transform reduces the accuracy of the reconstruction.
