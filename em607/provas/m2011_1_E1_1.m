clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')



M = [1 0; 0 0.5]
K = [400 -100; -100 100]

[phi, wn2] = eig(K, M)
wn = sqrt(wn2)
wn1= [wn(2,2) 0; 0 wn(1,1)]

qsi = [0.05 0; 0 0.01]

cr = 2 * qsi * wn
cr1= 2 * qsi * wn1