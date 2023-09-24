% okres - ze względu na zbyt duży krok mogą pojawiać się błędy
    disp(dsW);

    g=1;
    for(i=1:k)
        if(abs(funkcja_rys(i)-0) < 0.05)
            funkcja_rys(i);
            czas_T1(i)=i;
            if(czas_T1(i)>1)
            if(czas_T1(i)~=0 && czas_T1(i-1)==0)
                StT(g)=czas_T1(i);
                g=g+1;
            end
            end
        end
    end

    for(fw=2:g-1)
        Okres_Stopni=Fi(StT(fw))*180/pi-Fi(StT(fw-1))*180/pi
    end

    clear czas_T1 StT g Okres_Stopni fw
