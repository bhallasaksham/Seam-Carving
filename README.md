# Seam Carving
Seam Carving for Content Aware Image Resizing and Object Removal

## Introduction
The goal of this project is to perform content-aware image resizing for both reduction and expansion of an image. This allows image to be resized without losing or distorting meaningful content from scaling.

## Algorithm Overview
### Seam Removal

1. Calculate energy map: 
>Energy is calculated by sum the absolute value of the gradient in both x direction and y direction for all three channel (B, G, R). Energy map is a 2D image with the same dimension as input image.

2. Build accumulated cost matrix using forward energy: 
>This step is implemented with dynamic programming. The value of each pixel is equal to its corresponding value in the energy map added to the minimum new neighbor energy introduced by removing one of its three top neighbors (top-left, top-center, and top-right)


3. Find and remove minimum seam from top to bottom edge: 
>Backtracking from the bottom to the top edge of the accumulated cost matrix to find the minimum seam. All the pixels in each row after the pixel to be removed are shifted over one column to the left if it has index greater than the minimum seam.

4. Repeat step 1 - 3 until achieving targeting width 

## Result 1
### Original image
![original image](https://github.com/vivianhylee/seam-carving/raw/master/example/image6.jpg)

### Scaling up 
![image size expansion](https://github.com/vivianhylee/seam-carving/raw/master/example/image17_result.png)

### Object removal
![object removal](https://github.com/vivianhylee/seam-carving/raw/master/example/image22_result.png)

## Result 2
### Scaling down
![animation image size reduction](https://github.com/vivianhylee/seam-carving/raw/master/example/image05_video.gif)

### Scaling up 
![animation image size expansion](https://github.com/vivianhylee/seam-carving/raw/master/example/image7_video.gif)

### Object removal
![animation object removal](https://github.com/vivianhylee/seam-carving/raw/master/example/image11_video.gif)
