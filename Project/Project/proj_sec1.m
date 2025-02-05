%sec1
clc
clear all
close all
% data = importdata('C:\Users\psaei\Desktop\Control_final\Data.mat');
% m = data.magnitude;
% p = data.phase;
% o = data.omega;
% m_dB = 20*log10(m);
% subplot(2,1,1);
% semilogx(o, m_dB);
% xlabel('omega(rad/s)');
% ylabel('magnitude');
% title(' magnitude');
% grid on;
% subplot(2,1,2);
% semilogx(o, p);
% xlabel('omega(rad/s)');
% ylabel('phase');
% title('Phase');
% grid on;
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
% mm=1; 
% omedga_c = interp1(m, o,mm);
% oo=0.0222;
% P_M = interp1(o, p,oo)-180;
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
% %sec3
% p_rad = deg2rad(p);
% G_s = m .* exp(1j * p_rad);
% sampling_time = 0;
% data_o = idfrd(G_s, o, sampling_time);
% nz = 1;
% np = 3;
% transfer_func = tfest(data_o, np, nz);
% disp(transfer_func);
% % % % % % % % % % % % % % % % % % % % % % % % % % 
%sec5
% num=[0.1 -0.2];
% den=[1 0.9 9 0];
% sys=tf(num,den);
% rlocus(sys)
% hold on
% rlocus(-sys,'--')
% set(findall(figure(1),'type','line'),'linewidth',2)
% hold off
% num=[-1.5 3];
% den=[1 0.9 7.5 3];
% sys_k=tf(num,den);
% step(sys_k);
% s=zpk('s');
% sys_pi=(-15)*(1+(0.17/s))*((0.1*s-0.2)/(s^3 +0.9*s^2+9*s));
% sys_pi_close= feedback(sys_pi, 1)
% step(sys_pi_close);
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
%sec6
% num=[81];
% den=[1 0.9 90];
% sys=tf(num,den);
% step(sys);
% num=[0.1];
% den=[1 0.9 9];
% sys1=tf(num,den);
% s=zpk('s');
% sys2= 282.22*((0.43*s+1)/(0.022*s+1));
% sys3= 0.3371*((1+0.11*s)/(1+1.6*s));
% sys=sys1*sys2*sys3;
% sys_close= feedback(sys, 1)
% step(sys_close); 
% [y, t] = step(sys_close);
% info = stepinfo(y, t); % settlingTime
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
%sec7.1
% s=zpk('s');
% num=[0.1 -0.2];
% den=[1 0.9 9 0];
% G_s=tf(num,den);
% C_s= (-1.5048)*((1+9*s)/s);
% sys=C_s*G_s;
% sys_close= feedback(sys, 1);
% % ضرب سیستم در 1/s (انتگرال ورودی پله)
% sys_ramp = series(sys_close, tf(1, [1 0]));  
% % محاسبه پاسخ پله جدید که معادل پاسخ شیب است
% [y, t] = step(sys_ramp, 100);  % محاسبه پاسخ در 10 ثانیه
% % نمایش نتایج
% plot(t, y, 'b', 'LineWidth', 1.5);
% xlabel('time');
% ylabel('respons');
% title('ramp_res');
% grid on;
% % % % % % % % % % % % % % % % % % % % % % % % % % % 
%sec7.2
s=zpk('s');
num=[0.1 -0.2];
den=[1 0.9 9 0];
G_s=tf(num,den);
C_s=-5.9*(s^3+0.9*s^2+9*s)/(s^3+3*s^2+3.5*s);
sys=C_s*G_s;
% rlocus(sys)
% set(findall(figure(1),'type','line'),'linewidth',2)
% hold off
sys_close= feedback(sys, 1)
step(sys_close); 
[y, t] = step(sys_close);
info = stepinfo(y, t); % settlingTime





