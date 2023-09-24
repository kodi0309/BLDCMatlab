function [fa, fb, fc]=E_sila1(fi);

global p
% przebieg sinus
To=2*pi/3;

fa=sin(fi);
fb=sin(fi-To);
fc=sin(fi-2*To);


