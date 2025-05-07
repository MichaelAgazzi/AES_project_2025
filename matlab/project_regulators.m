T1 = 20;
T2 = 4;
Tset=600;
Tau_set = Tset/5;
wc = 1/Tau_set;
wc = 0.02;
Pn1 = 50;
Pn2 = 100;
Pn3 = 120;
s = tf('s');
G1 = Pn1/(1+s*T1)/(1+s*T2);
G2 = Pn2/(1+s*T1)/(1+s*T2);
G3 = Pn3/(1+s*T1)/(1+s*T2);
R1 = (1+s*T1)*wc/Pn1/s;
R2 = (1+s*T1)*wc/Pn2/s;
R3 = (1+s*T1)*wc/Pn3/s;
L1 = R1*G1;
L2 = R2*G2;
L3 = R3*G3;
beta1 = wc/Pn1
beta2 = wc/Pn2
beta3 = wc/Pn3
kp1 = T1*beta1
kp2 = T1*beta2
kp3 = T1*beta3
bode(L1);
margin(L1);
bode(L2);
margin(L2);
bode(L3);
margin(L3);

% Sensitivity 
S1 = 1/(55000*s*(2*pi*50)^2)/(1+L1);
bode(S1);
margin(S1);