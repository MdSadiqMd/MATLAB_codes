clc; clear all; close all
Pt_dBm = 0 : 40;
pt = 10.^((Pt_dBm-30)/10);
N = 1e4;
d1 = 1000; d2 = 500;
eta = 4;
h1 = sqrt(d1^-eta)*(randn(N,1)+j*randn(N,1))/sqrt(2);
h2 = sqrt(d2^-eta)*(randn(N,1)+j*randn(N,1))/sqrt(2);
g1 = (abs(h1)).^2;
g2 = (abs(h2)).^2;
BW = 1e6;
no = 1.38064852e-23 * 300 * BW;
a1 = 0.75; a2 = 0.25;
err = [0 1e-4 1e-3 1e-2];
for n=1:length(err)
for k=1:length(pt)
R_2_NOMA_d(k) = mean(log2(1 + a2*pt(k)*g2./(err(n)*a1*pt(k)*g2+no)));
end
R_2_NOMA_d_err(n,:) = R_2_NOMA_d;
end
figure
plot(Pt_dBm, R_2_NOMA_d_err(1,:),'-k','linewidth',2); hold on
plot(Pt_dBm, R_2_NOMA_d_err(2,:),'--k','linewidth',2); hold on
plot(Pt_dBm, R_2_NOMA_d_err(3,:),'.-k','linewidth',2); hold on
plot(Pt_dBm, R_2_NOMA_d_err(4,:),':k','linewidth',2); hold on
xlabel('Transmitted power [dBm]')
ylabel('Achievable rate (bps/Hz)')
title('The achievable data rate at user 2 with imperfect SIC')
legend('\epsilon = 0 (perfect SIC)','\epsilon = 10^{-4}','\epsilon = 10^{-3}','\epsilon = 10^{-2}')
grid
