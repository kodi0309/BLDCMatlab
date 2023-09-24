% Wykresy
    n=size(t);
    k=n(2);

    Xdesc='Przesunięcie:';
    Xakt=num2str(fi_0);
    XDesc=append(Xdesc, Xakt);

% okno 1
    %figure(1, 'Name','Prędkość obrotowa, kąt.')
    figure(1);
    pozycja_wykresu(1);

    % predkosc obrotowa
        subplot(211); 
        hold on;
        funkcja_rys=Om*30/pi;
        plot(Ts,funkcja_rys,Color=kol, DisplayName=XDesc);
    
        xlabel('t [s]');
        ylabel(' predkosc obr. [obr/min]');
        grid on;
        hold on;
                
    % szczegoły
        opis_wykresu;
    
    % kąt
        subplot(212); 
        hold on;
        funkcja_rys=Fi*180/pi;
        plot(Ts,funkcja_rys,Color=kol, DisplayName=XDesc)
        
        xlabel('t [s]')
        ylabel('kat obrotu [deg]')
        grid on
        hold on;

    % szczegoły
        opis_wykresu;
        
       
% okno 2
    %figure('Name','Moment elektryczny i moc')
    figure(2);
    pozycja_wykresu(2);
    
    % moment elektryczny
        subplot(211); 
        hold on
        funkcja_rys=Te;
        plot(Ts,funkcja_rys,Color=kol, DisplayName=XDesc)
        % plot(Ts,Ta,Ts,Tb,Ts,Tc)
        
        xlabel('t [s]')
        ylabel('Moment elektr. [Nm]')
        grid on
        hold on

    % szczegoły
        opis_wykresu;
    
    % moc elektryczna
        subplot(212); 
        hold on
        funkcja_rys=Nes;
        plot(Ts,funkcja_rys,Color=kol, DisplayName=XDesc)
        
        xlabel('t [s]')
        ylabel('Moc elektr. [W]')
        grid on
        hold on

    % szczegoły
        opis_wykresu;


        
% okno 3
    %figure('Name','Prądy')
        figure(3);
        pozycja_wykresu(3);
    
    % napięcia
        subplot(211); 
        hold on
        plot(Ts,Va,Ts,Vb,Ts,Vc)
        legend('V_a','V_b','V_c')
        
        xlabel('t [s]')
        ylabel('V [V]')
        grid on
        hold on
    
    % natężenia
        subplot(212); 
        hold on
        plot(Ts,Ia,Ts,Ib,Ts,Ic)
        legend('I_a','I_b','I_c')
        
        xlabel('t [s]')
        ylabel('I [A]')
        grid on
        hold on


        tn=round(Fi(end)*180/pi/120);

% okno 4
    %figure('Name','Napięcia')
        figure(4);
        pozycja_wykresu(4);
    
        subplot(311); hold on
        funkcja_rys=Va;
        dsW="Va";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        xlabel('Fi [deg]')
        ylabel('V_a [V]')
        grid on
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres
    
        subplot(312); hold on
        funkcja_rys=Vb;
        dsW="Vb";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        xlabel('Fi [deg]')
        ylabel('V_b [V]')
        grid on
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres
    
        subplot(313); hold on
        funkcja_rys=Vc;
        dsW="Vc";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        xlabel('Fi [deg]')
        ylabel('V_c [V]')
        grid on
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres

% okno 5
    %figure('Name','Natężenia')
        figure(5);
        pozycja_wykresu(5);
    
        subplot(311); hold on
        funkcja_rys=Ia;
        dsW="Ia";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        % plot(Fi*180/pi,fa)
        xlabel('Fi [deg]')
        ylabel('I_a [A]')
        grid on
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres
    
        subplot(312); hold on
        funkcja_rys=Ib;
        dsW="Ib";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        % plot(Fi*180/pi,fb)
        xlabel('Fi [deg]')
        ylabel('I_b [A]')
        grid on
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres
    
        subplot(313); hold on
        funkcja_rys=Ic;
        dsW="Ic";
        plot(Fi*180/pi,funkcja_rys,Color=kol, DisplayName=XDesc)
        % plot(Fi*180/pi,fc)
        xlabel('Fi [deg]')
        ylabel('I_c [A]')
        grid on   
        set(gca,'XTick',[0:120:120*tn])
        legend('-DynamicLegend', 'Location','eastoutside');
        okres



% figure(6); hold on
% plot(Fi*180/pi,fa,Fi*180/pi,fb,Fi*180/pi,fc)
% legend('fa','fb','fc')
% xlabel('Fi [deg]')
% ylabel('f [V]')
% grid on
% set(gca,'XTick',[0:120:120*tn])
% 
% 
% 
% figure(7)
% subplot(311); hold on
% plot(Ts,Va,Ts,Vb,Ts,Vc)
% legend('Va','Vb','Vc')
% xlabel('t [s]')
% ylabel('V [V]')
% 
% subplot(312); hold on
% plot(Ts,Ia,Ts,Ib,Ts,Ic)
% legend('Ia','Ib','Ic')
% xlabel('t [s]')
% ylabel('I [A]')
% 
% subplot(313); hold on
% plot(Ts,fa,Ts,fb,Ts,fc)
% legend('fa','fb','fc')
% xlabel('t [s]')
% ylabel('f [V]')
% 
% subplot(313); hold on
% plot(Ts,Te,Color=kol)
% xlabel('t [s]')
% ylabel('Te [Nm]')
