function pozycja_wykresu (rozmieszczenie_wykresow)

set(0,'units','pixels');
poz=get(0,'ScreenSize');

switch rozmieszczenie_wykresow
       case 1
            left_space=0;
            bottom_space=52*poz(1,4)/100;
       case 2
            left_space=poz(1,3)/3;
            bottom_space=52*poz(1,4)/100;
       case 3
            left_space=2*poz(1,3)/3;
            bottom_space=52*poz(1,4)/100;
       case 4
            left_space=0;
            bottom_space=poz(1,4)/20;
       case 5
            left_space=poz(1,3)/3;
            bottom_space=poz(1,4)/20;
       case 6
            left_space=2*poz(1,3)/3;
            bottom_space=poz(1,4)/20;
            
end

    width=poz(1,3)/3;
    height=3*poz(1,4)/8;

set(gcf,'position',[left_space bottom_space width height]);

end