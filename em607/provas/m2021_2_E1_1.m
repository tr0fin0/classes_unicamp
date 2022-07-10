clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')



m   = 10;
c   = 10;
k   = 10;

y0  = 10;
w   = 0 : 0.001 : 5;

trn = @transmissibility;
frequencyResponse1DOF(trn, y0, w, m, c, k)

rtr = @rotaryUnbalance;
frequencyResponse1DOF(rtr, y0, w, m, c, k)

hrm = @harmonicExcitation;
frequencyResponse1DOF(hrm, y0, w, m, c, k)