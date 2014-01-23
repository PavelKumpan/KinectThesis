clc;
clear all;

poisson = imread('..\..\KinnectDepth\KinnectDepth\bin\Debug\poissonDisk2.gif');
poisson = ~poisson;
blacksum = (sum(poisson(:)) / 3)
