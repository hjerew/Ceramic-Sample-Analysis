clear all
machines=5;
samples=6;
length=0;
L=34;
B=[6.01 6.00 5.95 5.93 5.95 5.87;6 6.02 6 5.99 6.01 6.04;
    5.99 6.02 6 6.01 6.01 5.99; 5.99 5.97 5.99 6.02 5.99 6.00;
    5.97 6.00 5.92 6.045 5.99 6.00];
    
H=[5.99 5.99 5.96 5.97 5.96 5.92;6 6 6.02 6.02 5.99 6.03;
    5.98 6.00 6.02 6.01 6.03 6.03;5.99 5.99 6.01 5.97 6.01 5.99;
    5.99 6.00 5.97 6.03 5.99 6.01];
FS=zeros(machines,samples);
for m=1:1:machines
    for s=1:1:samples
        machine=int2str(m);
        sample=int2str(s);
        filename=strcat('m',machine,'s',sample,'.csv');
        varname=strcat('M',machine,'S',sample);
        eval([varname '= readmatrix(filename);']);
        b=B(m,s);
        h=H(m,s);
        Fmax=eval(['max(' varname ')']);
        FS(m,s)=((3*L)/(2*b*h^2))*Fmax(3);
    end
end

% m=1;
% machine=int2str(m);
% for s=1:1:samples
%     sample=int2str(s);
%     filename=strcat('m',machine,'s',sample,'.csv');
%     varname=strcat('M',machine,'S',sample);
%     eval([varname '= readmatrix(filename);']);
%     b=B(m,s);
%     h=H(m,s);
%     length=eval(['size(' varname ');']);
%     stressName=strcat('stress',sample);
%     strainName=strcat('strain',sample);
%     eval([stressName '=zeros(length(1),1);']);
%     eval([strainName '=zeros(length(1),1);']);
%         for i=1:1:length(1)
%             eval([stressName '(i) =((3*L)/(2*b*h^2))*' varname '(i,3);']);
%             eval([strainName '(i) =((6*h)/(L^2))*' varname '(i,2);']);
%         end
% end
% 
% plot(strain1,stress1);
% hold on
% plot(strain2,stress2);
% plot(strain3,stress3);
% plot(strain4,stress4);
% plot(strain5,stress5);
% plot(strain6,stress6);
% grid on
% xlabel('Strain')
% ylabel('Stress (MPa)')
% legend('Sample 1','Sample 2','Sample 3','Sample 4','Sample 5','Sample 6');
% title('Stress - Strain Curves for Samples from Machine 1');
% 
% % plot(M1S1(:,2),M1S1(:,3));
% % hold on
% % plot(M1S2(:,2),M1S2(:,3));
% % plot(M1S3(:,2),M1S3(:,3));
% % plot(M1S4(:,2),M1S4(:,3));
% % plot(M1S5(:,2),M1S5(:,3));
% % plot(M1S6(:,2),M1S6(:,3));
% % grid on
% % xlabel('Displacement (mm)');
% % ylabel('Force Measurement (N)');
% % title('Force - Displacement Curves for Samples from Machine 1');
% % legend('Sample 1','Sample 2','Sample 3','Sample 4','Sample 5','Sample 6');




