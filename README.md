# image-preprocessing

### Image Format Conversion

The TIF image format is usually the preferred format for preprocessing. Therefore if the raw images are in a different format, one would need to convert it to TIF.
For example, if the images are IMS (imaris file format) they would need to be converted from IMS to TIF
Refer to [this documentation](https://docs.google.com/document/d/1O-mWoCaFsKmQY7QfEU1NhL3cyS8SfPCvKUoiIK5zcQQ/edit) for an in depth description of the file conversion pipeline (from IMS to TIF)


### Registration, Merge and Crop

Registration is a pre-processing step for cyclic imaging data. 
For example, if there is a dataset with 5 Cycles of imaging (Cycle 0, Cycle 1, Cycle 2, Cycle 3, Cycle 4), Cycle 0 will likely be the reference, where the rest of the cycles will be aligned onto the Cycle 0 images. 
It is important to visualize the X and Y shift so that one can filter out any egregiously shifted images or erroneously registered images. This step is an aid to do so holistically. 
Merging is concatenating all of the cycles together into one image 
For example, the 5 Cycles of images will be merged together. If each cycle had 5 channels, the resulting merged image would be 25 channels.
Cropping is for removing empty space that might result from X and Y shifts from registration as well as rotation. Using trigonometry, the empty space is calculated with the transformation matrix numbers, and the dimensions are applied in the code to crop out the appropriate amount of space. 
Refer to [this documentation] (https://docs.google.com/document/d/1J2-apRoWXOqydC1ti-lHzeWqLtRXN-iLLmPUX5jge3c/edit) for a description of how to get started with the pipeline


### Extreme Pixel Intensity Check (Included at the end of Registration pipeline) 

This part of the QC is used to check for any pixels that might be extreme and not applicable for downstream analysis.
For example, from the registration step, there can be edge artifacts that have intensity values over 65k, as well as oversaturated areas that have pixel intensity values of zero, and are surrounded by pixels over 65k (in 16-bit images). 
Sometimes, the images can be corrupted, which can result in large black boxes that appear in the images with 0 intensity pixels outlined by pixels over 65k intensity.


*** Cell segmentation comes after this, which is a necessary step to extract features from each of the cells from each image. Typically, the soma and nuclei are segmented for each image using Cellpose 2. (Refer to [this documentation] (https://docs.google.com/document/d/1Hv0edCc2tVscYzYVikYOnAQ2kpr2FL43yKQp3d3ghVw/edit) for an in depth description of the segmentation pipeline)
