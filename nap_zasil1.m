function [Va, Vb, Vc]=nap_zasil1(t,V,f,fi_0,p);

global unipolar PWM st_wp

% przebieg sinus
To=2*pi/3;





    Va=V*sin(2*pi*f*t+fi_0);
    Vb=V*sin(2*pi*f*t-To+fi_0);
    Vc=V*sin(2*pi*f*t-2*To+fi_0);
    
    
%%%%%%%%%%%%%%%%%%%%%5    
if PWM==0

else
        
    fr=f*5;
    
        if Va>0
            Va = V*(square(2*pi*fr*t,st_wp)+1)/2;
        else
             Va = -V*(square(2*pi*fr*t,st_wp)+1)/2;
        end  
    
         if Vb>0
            Vb = V*(square(2*pi*fr*t,st_wp)+1)/2;
        else
             Vb = -V*(square(2*pi*fr*t,st_wp)+1)/2;
         end  
        
        if Vc>0
            Vc = V*(square(2*pi*fr*t,st_wp)+1)/2;
        else
             Vc = -V*(square(2*pi*fr*t,st_wp)+1)/2;
        end  
    
    
end

% Va=sign(Va)*V;
% Vb=sign(Vb)*V;
% Vc=sign(Vc)*V;




if unipolar==1
    
    if Va>0
    else
        Va=0;
    end


    if Vb>0
    else
        Vb=0;
    end


    if Vc>0
    else
        Vc=0;
    end
    
else
end
