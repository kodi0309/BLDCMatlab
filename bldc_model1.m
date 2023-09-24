%model silnika BLDC 
% 3 uzwojenia po³¹czone w gwiazdê
function dx=bldc_model1(t,x);

global Rs lam L Bt J p fa fb fc u V f  Tz fi_0 k_om
% x=[Ia Ib Ic om fi]
 Om=x(4);
 Fi=x(5);
 
 f=Om/(2*pi)*k_om;
 [Va Vb Vc]=nap_zasil1(t,V,f,fi_0,p);
 
 
 Tzew=mom_obc(t) +Tz;
 
 u=[Va Vb Vc Tzew]';


     
 [fa fb fc]=E_sila1(Fi);
  
A=[-Rs/L    0      0      lam*fa/L  0;
        0      -Rs/L  0      lam*fb/L  0;
        0        0    -Rs/L  lam*fc/L  0;
    lam*fa/J  lam*fb/J lam*fc/J  -Bt/J 0;
     0              0               0           p/2 0];

 B=[1/L     0   0       0;
        0     1/L   0       0;
        0       0    1/L    0;
        0       0       0       -1/J;
        0       0       0           0];
    
    
    dx=A*x+B*u;
