% punkt maksymalny
    czas_max=1;
    for(i=2:k)
        if(funkcja_rys(i)>0 && funkcja_rys(i)==max(funkcja_rys));
            czas_max=i;
        end

        if(funkcja_rys(i)<0 && funkcja_rys(i)==min(funkcja_rys));
            czas_max=i;
        end
    end


% legenda 
    VMAXdesc='MAX:';
    VMAXakt=num2str(funkcja_rys(czas_max));
    TMAXdesc='   t:';
    TMAX=num2str(Ts(czas_max));      
    DescMAX=append(VMAXdesc, VMAXakt, TMAXdesc, TMAX);

    plot(Ts(czas_max),funkcja_rys(czas_max),'*k', DisplayName=DescMAX) 
    text(Ts(czas_max),funkcja_rys(czas_max),'MAX')

    legend('-DynamicLegend', 'Location','eastoutside');
    %legend(Desc,DescMAX,'Location','southeast','NumColumns',2);