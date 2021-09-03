@echo off
chcp 65001

set BINDIR=bin
set TESTDIR=test
set MODDIR=mod

gfortran -Wall ./%TESTDIR%/test_array_bounds.f90 -o ./%BINDIR%/test_array_bounds.exe -J %MODDIR%
gfortran -Wall ./%TESTDIR%/test_matmul.f90 -o ./%BINDIR%/test_matmul.exe -J %MODDIR%
gfortran -Wall -fopenmp ./%TESTDIR%/test_quicksort.f90 -o ./%BINDIR%/test_quicksort.exe -J %MODDIR%

echo Выполняем test_array_bounds
%BINDIR%\test_array_bounds.exe 

echo Выполняем test_matmul
%BINDIR%\test_matmul.exe

echo Выполняем test_quicksort
%BINDIR%\test_quicksort.exe

pause
