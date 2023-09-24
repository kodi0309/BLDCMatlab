function Tz=mom_obc(t)
% przebieg czasowy momentu obci¹zaj¹cego silnik BLDC

t1=300;

if t<t1
    Tz=0;
else
    Tz=0.3*(t-t1);
end


