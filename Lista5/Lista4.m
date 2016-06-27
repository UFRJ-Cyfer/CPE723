%Lista4-2016.1
FreqAmo = 20e6
FreqPas = 2.5e6
Rip = 0.4
FreqRej = 4.5e6
AtenuRej = 60

% Butterworth
    [Nbut,Wbut] = buttord(FreqPas*(2/FreqAmo),FreqRej*(2/FreqAmo),Rip,AtenuRej)
% Chebyshev
    [Nche1,Wche1] = cheb1ord(FreqPas*(2/FreqAmo),FreqRej*(2/FreqAmo),Rip,AtenuRej)
% Chebyshev2
    [Nche2,Wche2] = cheb2ord(FreqPas*(2/FreqAmo),FreqRej*(2/FreqAmo),Rip,AtenuRej)
% Eliptica
    [Nelipt,Welipt] = ellipord(FreqPas*(2/FreqAmo),FreqRej*(2/FreqAmo),Rip,AtenuRej)
    
%----------------Questão1---------------------------
 %H(Z) = B(Z)/A(Z)
format shortE
% Butterworth
    [B1,A1] = butter(Nbut,Wbut);
    Zeros_Butterworth = B1
    Polos_Butterworth = A1
% Chebyshev1
    [B2,A2] = cheby1(Nche1,Rip,Wche1);
    Zeros_Chebyshev1 = B2
    Polos_Chebyshev1 = A2
% Chebyshev2
    [B3,A3] = cheby2(Nche2,AtenuRej,Wche2);
    Zeros_Chebyshev2 = B3
    Polos_Chebyshev2 = A3
% Eliptica
    [B4,A4] = ellip(Nelipt,Rip,AtenuRej,Welipt);
    Zeros_Eliptico = B4
    Polos_Eliptico = A4
    
%----------------Questão2---------------------------

% Butterworth
    [H1,W1] = freqz (B1,A1);
    %Módulo
    dB = mag2db(abs(H1));
    plot1 = subplot(2,2,1);
    plot (W1/pi, dB,'k','LineWidth',2); hold on;
    plot2 = subplot(2,2,2);
    plot (W1/pi, dB,'k','LineWidth',2); hold on;
    ylim(plot1,[-80 5])
    ylim(plot2,[-0.5 0.1])
    %Fase
    plot3 = subplot(2,2,3);
    plot (W1/pi,unwrap(angle(H1)),'k','LineWidth',2); hold on;
    xlim([0 1]);
    %Atraso
    plot4 = subplot(2,2,4);
    plot (W1/pi,grpdelay(B1,A1),'k','LineWidth',2); hold on;
    xlim([0 0.95]);
    ylim([0 30]);
    
% Chebyshev1
    [H2,W2] = freqz (B2,A2);
    %Módulo
    dB = mag2db(abs(H2));
    plot1 = subplot(2,2,1);
    plot (W2/pi, dB,'g','LineWidth',2); hold on;
    plot2 = subplot(2,2,2);
    plot (W2/pi, dB,'g','LineWidth',2); hold on;
    ylim(plot1,[-80 5])
    ylim(plot2,[-0.5 0.1])
    %Fase
    plot3 = subplot(2,2,3);
    plot (W2/pi,unwrap(angle(H2)),'g','LineWidth',2); hold on;
    xlim([0 1]);
    %Atraso
    plot4 = subplot(2,2,4);
    plot (W2/pi,grpdelay(B2,A2),'g','LineWidth',2); hold on;
    xlim([0 0.95]);
    ylim([0 30]);
    
% Chebyshev2
    [H3,W3] = freqz (B3,A3);
    %Módulo
    dB = mag2db(abs(H3));
    plot1 = subplot(2,2,1);
    plot (W3/pi, dB,'b','LineWidth',2); hold on;
    plot2 = subplot(2,2,2);
    plot (W3/pi, dB,'b','LineWidth',2); hold on;
    ylim(plot1,[-80 5])
    ylim(plot2,[-0.5 0.1])
    %Fase
    plot3 = subplot(2,2,3);
    plot (W3/pi,unwrap(angle(H3)),'b','LineWidth',2); hold on;
    xlim([0 1]);
    %Atraso
    plot4 = subplot(2,2,4);
    plot (W3/pi,grpdelay(B3,A3),'b','LineWidth',2); hold on;
    xlim([0 0.95]);
    ylim([0 30]);
% Eliptica
    [H4,W4] = freqz (B4,A4);
    %Módulo
    dB = mag2db(abs(H4));
    plot1 = subplot(2,2,1);
    plot (W4/pi, dB,'r','LineWidth',2); hold on;
    plot2 = subplot(2,2,2);
    plot (W4/pi, dB,'r','LineWidth',2); hold on;
    ylim(plot1,[-80 5])
    ylim(plot2,[-0.5 0.1])
    %Fase
    plot3 = subplot(2,2,3);
    plot (W4/pi,unwrap(angle(H4)),'r','LineWidth',2); hold on;
    xlim([0 1]);
    %Atraso
    plot4 = subplot(2,2,4);
    plot (W4/pi,grpdelay(B4,A4),'r','LineWidth',2); hold on;
    xlim([0 0.95]);
    ylim([0 30]);
 
%eixos
    xlabel(plot1,'Frequência normalizada')
    ylabel(plot1,'Módulo')
    legend('Butterworth','Chebyshev1','Chebyshev2','Elíptico')
    xlabel(plot2,'Frequência normalizada')
    ylabel(plot2,'Módulo')
    xlabel(plot3,'Frequência normalizada')
    ylabel(plot3,'Fase')
    xlabel(plot4,'Frequência normalizada')
    ylabel(plot4,'Atraso de Grupo')
    legend('Butterworth','Chebyshev1','Chebyshev2','Elíptico')
   
%----------------Questão4---------------------------
    
% Butterworth
    figure
    zplane(B1,A1)
    title('Butterworth')
% Chebyshev1
    figure
    zplane(B3,A3)
    title('Chebyshev1')
% Chebyshev2
    figure
    zplane(B3,A3)
    title('Chebyshev2')
% Eliptica
    figure
    zplane(B4,A4)
    title('Elíptico')
 