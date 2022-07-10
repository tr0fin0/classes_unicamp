clc
clear all
close all

RA = 217276;
feature('DefaultCharacterSet','UTF-8')


% Q2________________________________________________________ 
if true
    r   = 1.7905;
    qsi = 0.15;

    D   = 25;

    X   = D * (sqrt(1 + (2*qsi*r).^2)) / (sqrt((1 - r^2)^2 + (2*qsi*r)^2))



    r   = r / sqrt(6);
    qsi = sqrt(6) * qsi;

    D   = 25;

    X   = D * (sqrt(1 + (2*qsi*r).^2)) / (sqrt((1 - r^2)^2 + (2*qsi*r)^2))
end