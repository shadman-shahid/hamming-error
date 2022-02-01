## Photomath
Often, we need to solve large mathematical equations fast and with less effort. Simple Photomath has been built from that need. All that is required is an image of the math that one is required to solve. Simple Photomath is a program that can solve or simplify a number of mathematical equations and problems, which are extracted from its image. Thereafter one will get as output, the solution of that math. Photomath can perform 4 functions:

1. Solve polynomial equations (Up to any degree)

2. Solve system of linear equations (Up to any number of variables)

3. Simplify Mathematical expressions

4. Derive the polynomial equation of a graph from its image.

# The Program:

**Combined.m**: 

This is the main function of the program. This file takes as input the given image file. “uigetfile()” is used which displays a modal dialog box that lists files in the current folder and enables user to select or enter the name of a file. This image file is converted to text by OCR. This function contains all the other sub-functions of this program. After running OCR extracted text from image is save in a file named ‘extracted.txt’ in the same directory of image. (If no text is detected in the text file obtained after conversion from OCR then the image is passed on to the graphing.m function)
**i. funcNvar.m**: This function takes as input the text obtained after processing the image. It detects ‘=’ sign and gives as output the number of variables in the text file. If the ‘=’ is not detected, then the text is passed onto the simplification.m file. Otherwise, if the number of variables is 1, then it is passed onto the funcpolynomial.m; if greater than 1, then it is passed onto funclinear.m.

**ii. simplification.m**: It takes as input the string from the text file. Thereafter, it gives as output, the final result of the simplification problem.

**iii. funclinear.m**: It takes as input the string from the text file. Thereafter, it gives as output, the augmented matrix and the solution set of the set of equations

**iv. funcpolynomial.m**: It reads the string input and give the roots (both real and complex) of the polynomial equations as output.

**v. graphing.m**: It takes the binary image matrix as input and provides the vector containing the coefficient values (in order of decreasing power of x) and the graph obtained from that equation as output.
