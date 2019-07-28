machines=5;
samples=6;
N=30;
exp=zeros(30,5);
sorted=sort(FS(:)).';
for m=1:1:machines*samples
        exp(m,1)=m;
        
        fs=sorted(m)
        exp(m,2)=fs;
        
        Pf=m/(N+1);
        exp(m,3)=Pf;
        
        lhs=log(log(1/(1-Pf)));
        exp(m,4)=lhs;
        
        rhs=log(fs);
        exp(m,5)=rhs;

end
scatter(exp(3:30,5),exp(3:30,4));
hold on
grid on
% sorted=reshape(sort(FS(:)), size(FS,2),size(FS,1)).'