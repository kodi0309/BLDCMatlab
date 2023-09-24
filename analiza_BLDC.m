% modelowanie silnika BLDC z magnesami sta�ymi 
% na wirniku oraz 3-ma uzwojenia stojanu (gwiazda)

disp('Modelowanie silnika BLDC z magnesami sta�ymi; 3 uzwojenia')
disp('Projekt wykonali: ')
disp('Mariusz Kot oraz Klaudiusz Koz�owski 13A6 P04')

% czyszczenie okien wykres�w i konsoli
     reset_dlgTitle    = 'Resetowanie wykres�w';
     reset_dlgQuestion = 'Czy wymaza� wykresy?';
     reset = questdlg(reset_dlgQuestion,reset_dlgTitle,'Tak','Nie','Nie')
     
     if(reset=='Tak')
         clear all
         close all
         clc 
     end
    
     clear all
        
% kolory na wykresach 
    niebieski="#0072BD"; 
    zielony="#77AC30";
    czerwony="#A2142F";
    fioletowy="#7E2F8E";
    zolty="#EDB120";
    pomaranczowy="#D95319";

    % menu wyboru koloru
        color_msg = "Wybierz kolor wykresu:";
        color_opts = ["niebieski" "zielony" "czerwony" "fioletowy" "z�ty" "pomara�czowy"];
        color_choice = menu(color_msg,color_opts);

   switch color_choice
       case 1
            kol=niebieski;
       case 2
            kol=zielony;
       case 3
            kol=czerwony;
       case 4
            kol=fioletowy;
       case 5
            kol=zolty;
       case 6
            kol=pomaranczowy;
       otherwise
            kol="k";
    end
   

% dane wejsciowe
    global Rs lam L Bt J p fa fb fc u V f  fi_0 k_om  Tz unipolar PWM st_wp
    Rs=1; %[Om] oporno�� cewki
    L=0.01;  %[H] indukcyjno�� cewki
    J=0.001/2; %[kgm2] moment bezw�adno�ci wirnika silnika
    Bt=0.001; %[Nm*s] wsp.oporu obrotu wirnika
    p=2; %[] liczba biegun�w magnetycznych wirnika
    lam=0.03; % wsp�czynnik strumienia magnetycznego
    Tz=0; %[Nm] moment obci��enia zewn�trznego
    k_om=0.55; %wsp�czynnik sterowania


% pocz�tkowe obroty silnika [rad/s]
    Om_0=0*pi/30; 

% dane dla programu
    DATA_prompt = {'Czas symulacji [s]','Podaj napi�cie zasilania [V]:','Podaj przesuni�cie fazowe napi�cia steruj�cego:', 'Sterowanie (0-bipolarne/1-unipolarne): ', 'PWM (0-off/1-on) : ', 'Stopie� wype�nienia PWM [0-100] :'};
    DATA_dlgtitle = 'Dane wej�ciowe';
    DATA_dims = [1 35];
    DATA_definput = {'0.5','2','0','0','0','100'};
    DATA_answer = inputdlg(DATA_prompt,DATA_dlgtitle,DATA_dims,DATA_definput);

    ts=str2double(DATA_answer(1));

    V=str2double(DATA_answer(2)); %[V] napi�cie zasilania
    fi_0=str2double(DATA_answer(3)); % przesuni�cie fazowe napi�cia steruj�cego
    unipolar=str2double(DATA_answer(4)); %wyb�r sterowania unipolarnego (unipolar=0 oznacza ster. bipolarne)
    PWM=str2double(DATA_answer(5)); %sterowanie PWM=1
    st_wp=str2double(DATA_answer(6)); %0-100%; stopie� wype�nienia PWM

    if(unipolar~=1 && unipolar~=0 || PWM~=1 && PWM~=0 || st_wp>100 && st_wp<0)
        f = errordlg('Wprowadzone dane nie mieszcz� sie w odpowiednich zakresach','B��d danych');
        clear all
    end

% lista program�w
    % program 1- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar=1;V= 2 4 6;
    
    % program 2- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar;=1 ;V= 4
    % unipolar=0 (bipolarne);V= 2;
    
    % program 3- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar=0 (bipolarne);V= 2 -2; (zmian kierunku obr.)
    
    % program 4- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar=0 (bipolarne);V= 2; fi_0=0, 45, 90, 180,
    
    % program 5- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar=0 (bipolarne);V= 2; 
    % PMW=1; st_wp=100; sterowanie prostok�tem
    
    % program 6- rozp�dzanie silnika bez obci��enia zewn.
    % unipolar=0 (bipolarne);V= 2; 
    % PMW=1; st_wp=100-10; sterowanie prostok�tem o r�nym wype�nieniu

 
%rozwi�zanie uk�adu r�wna�
    % x=[Ia Ib Ic om fi]

    t=[0:0.005:ts];
    war_pocz=[0 0 0 Om_0 0]';
    dx=bldc_model1(0,war_pocz);

    [Ts,Xs]=ode45('bldc_model1',t,war_pocz);
    Ia=Xs(:,1);
    Ib=Xs(:,2);
    Ic=Xs(:,3);
    Om=Xs(:,4);
    Fi=Xs(:,5);

% obliczenia po�rednie
    f=Om/(2*pi)*k_om;
    
    for i=1:length(Ts)
          [Va(i), Vb(i), Vc(i)]=nap_zasil1(Ts(i),V,f(i),fi_0,p);
         [fa(i), fb(i), fc(i)]=E_sila1(Fi(i));
    end
    
    Ta=lam*fa.*Ia' ;
    Tb= lam*fb.*Ib';
    Tc=lam*fc.*Ic';
    Te=  (lam*fa.*Ia' + lam*fb.*Ib' + lam*fc.*Ic'); %moment elektromangetyczny
    Ne=Va.*Ia' + Vb.*Ib' + Vc.*Ic'; %moc elektryczna
    Nes=abs(Va.*Ia') + abs(Vb.*Ib') + abs(Vc.*Ic'); %moc elektryczna

% wykresy
    wykresy;
