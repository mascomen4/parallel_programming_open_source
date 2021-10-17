# PFUR Open Source Fortran Parallel Programming Course

### Abstract
IMPORTANT: *lab01* directory is out of date. Please, use *lab01_new* for the first lab  

Note: First line of each file consists of something like `! Created by ivan on 10.09.2021.`. Please, do remember to remove that line if you want to test
the project on your own.  
Note: Please, refer to branch `develop` for the most recent updates  
Note: I suggest that you have read the task in esystem.pfur.ru


### Labs progress:
Lab 01: ![100%](https://progress-bar.dev/100) Lab 02: ![0%](https://progress-bar.dev/100)  Lab 03: ![0%](https://progress-bar.dev/0)  Lab 04: ![0%](https://progress-bar.dev/0)  

# Prerequisites:
1. Miniconda or Anaconda distribution: https://docs.conda.io/en/latest/miniconda.html for plotting data in ex1. 
2. Compiler: GFortran. 
  - Linux Ubuntu installation: ``` sudo apt install gfortran ```, but first check if it's already installed ``` which gfortran ```
  - Windows: You can download TDM-GCC.exe for windows and mark all the checkboxes somehow related to `fopenmp` during the installation.
4. IDE: CLion (you can claim the license having a student status)
5. For CLion Fortran plugin refer here: https://www.jetbrains.com/help/clion/fortran-support.html

# Usage:

- ``` git clone git@github.com:mascomen4/parallel_programming_open_source.git ```
- Then in your IDE open the project, choose any **main** function from any exercise in configurations and run it. For example, choose **main_ex3** to run the tests over the ex2.f90 fortran file.
- The project is being built using CMake, so you don't need to write the flag `-fopenmp` for each file, as it's written in the file `CMakeLists.txt`
- Each exercise consists of some number of points. Fer every point I made the `main` file, so you can easily select&run it.
- *Note to Windows users:* in `ex1_point3.f90` you may experience some troubles with writing to file. Or memory access. You may need to change the size of array and the number of iterations from 10^6 to the 10^3, and increase the number of the nested iterations to from 10^2 to 10^4.
- *Note for Windows users in Question 3 in Ex.2* the command to know the number of cores is `wmic cpu get NumberOfCores`. The number of threads is numbers of cores multiplied by 2.
- In `main_ex2_point2` you need to change in `Edit Configurations...` the Environment variable to `OMP_NUM_THREADS=Number`, where `Number` is the number of desired cores. Also you may need to write `Number` in Program arguments (it's also located in `Edit Configurations`. (If you don't understand why, please read the task first)
- You can visualize the data in ex1 using either `Visuzalization.ipynb` either `plot.py`. `plot.py` is designed to be called from the command line.

# Contribution 
1. Write me you github name so I could add you 
