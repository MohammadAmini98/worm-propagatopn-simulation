clear

x=100;
y=200;
delta=0.25;
size=x*y;
N = size*delta;      %Total population
I = 1;               %Infector
S = N - I;           %susceptible person
R = 5;               %Number of infected persons exposed to susceptible persons
B = 0.8;             %Probability of infection
days =30;





average=zeros(1,days);
%axis([0 x 0 y]);
%plot(xpos,ypos,'rs','LineWidth',1,'MarkerSize',1);
average=zeros(1,days);
for m=1:1:50

state=zeros(1,N);   
index=randperm(N,I);
state(index)=1;

   
xpos=x*(randperm(N)/N);
ypos=y*(randperm(N)/N);
Sdata=zeros(1,days);  


for i=1:days
number=zeros(1,N);
%     if sum(state)==N
%         break
%     end
    for j=1:N
        if state(j)~=1
            continue
        end
  
       
        dis=sqrt((xpos-xpos(j)).^2+(ypos-ypos(j)).^2);
        l=0;
        for k=1:N
            if state(k)==1
                continue
            end
            
            if number(k)==1
                continue
            end
            
            
            
            if(dis(k)<=R)
                l=l+1;
                peo(l)=dis(k);
                xx=rand();
                     if xx<=B
                        state(k)=1;
                        number(k)=1;
                     end
          
            end
            
        end     
  end
     Sdata(i)=sum(state);
    end
    average= average +Sdata; 
end
average=average/m;
    
  

%Display curves of simulated data and calculate theoretical data
figure
set(gcf,'visible',true)
days=length(average);
plot(1:days,average,1:days,N-average)
hold on
T = 1:days;
for idx = 1:length(T)-1
    if S(idx)<0
        S(idx)=0;
    end
    if I(idx)>N
        I(idx)=N;
    end
    S(idx+1) = S(idx) - R*B*I(idx)*S(idx)/N;
    I(idx+1) = I(idx) + R*B*I(idx)*S(idx)/N;
end
plot(T,S,T,I);
legend('Simulated Infector','Simulate susceptible people','susceptible people','Infector');
xlabel('Day');ylabel('Number of people')
title('SI model')