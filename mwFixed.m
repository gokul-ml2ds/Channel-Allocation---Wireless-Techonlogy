% code for checking condition for cluster size ( i^2 +j^2+ij) 
for i=0:5
    for j=0:5
        size = i^2 + j^2+ i*j;
        a(i+1,j+1) = size;
    end
end

a = unique(a);

y=0;
channel = input("Enter number of channels: ");

control = ceil(0.2*channel);
traffic = channel - control;
disp("There are "+control +" control channels" );
disp("There are "+traffic +" traffic channels" );
while y~=1
cluster = input("Enter size of cluster: ");
y = ismember(cluster,a);
if y~= 1
    disp(" Error wrong cluster size !! ");
    disp(" ");
end
end
trf = zeros(cluster,ceil(traffic/cluster));
ctrl = zeros(cluster,ceil(control/cluster));
x = control + 1;
temp = zeros();
num=1;
count=0;
for i=1:ceil(control/cluster)
    temp=num; % values where control is 0
    for j=1:cluster
        if num<=control
            ctrl(j,i)=num;
            num=num+1;
        else 
            count = count + 1;
            if count<3 
                num = temp;
                ctrl(j,i) = num;
                num = num + 1;
            else
                ctrl(j,i)=0;
                temp = [temp,j];
            end     
        end
    end
end
temp(temp == 1) = [];
for i=1:ceil(traffic/cluster)
    for j=1:cluster
        flag = ismember(j,temp); %% checks the control positions where cell is 0 and assings traffic also 0
        if x<=channel
            trf(j,i) = floor(x);
            x = x + 1;
        if flag == 1
            trf(j,i) = 0;
        end
        else
            trf(j,i) = 0;
        end
    end
end


disp("Control Matrix: ")
disp(ctrl)

disp("Control channel is nulls at cells: ")
disp(temp) 

disp("Traffic Matrix: ")
disp(trf)
               
        
            
                
          
            
            
            
    
    


