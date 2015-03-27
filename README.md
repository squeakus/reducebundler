# reducebundler
When using videos for photogrammetry the bundle file can get very large. This program will reduce the number of images in Snavely's bundler format.

copy reducebundle.sh to the relevant folder, e.g.: model.nvm.cmvs/00
run the command: ./reducebundle n
where n is every nth image that will be copied.

It will generate bundle2.rd.out and list2.txt for the registered images

poisson.mlx is a script for generating a mesh from a point cloud in meshlab

The other files are components of the main script used for debugging:
modcopy.sh <- copy every nth image
reorder.sh <- make the image order incremental again
trimbundle.sh <- cut out the coordinates for each image in the bundle file

