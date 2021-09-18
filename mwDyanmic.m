% code for checking condition for cluster size ( i^2 +j^2+ij) 
for i=0:5
    for j=0:5
        size = i^2 + j^2+ i*j;
        a(i+1,j+1) = size;
    end
end

a = unique(a);
channel = input("Enter number of channels: ");
y=0;
while y~=1
cluster = input("Enter size of cluster: ");
y = ismember(cluster,a);
if y~= 1
    disp(" Error wrong cluster size !! ");
    disp(" ");
end
end
ch_ls = zeros();
for i = 1: cluster
    ch_req = input("Enter requirement for cell"+i+": ");
    ch_ls(i) = ch_req;
end
sum_all = sum(ch_ls);
disp("  ");
disp("The sum of all required cells is :"+sum_all);
prob = (channel/sum_all);

if sum_all>channel
    for i = 1:length(ch_ls)
        s = 1/sum_all;
        ch_ls(i)=floor(ch_ls(i)*channel*s);
        if ch_ls(i)==0
            ch_ls(i)=0;
            
        end
    end
end

 all_ch = zeros(); 
for i= 1:channel
  all_ch(i) = i;  
end
disp("High Priority channels are : ");
%disp(all_ch);
highp_ch = [];
hc = ceil(channel/2);
highp_ch = randsample(all_ch,hc);
disp(highp_ch);
disp("Low Priority channels are : ");
lowp_ch = [];
lowp_ch = setdiff(all_ch,highp_ch);
disp(lowp_ch);
cell=[];
i=0;

sum_all1 = sum(ch_ls);
disp("  ");
disp("The new sum of all total req cells is :"+sum_all1);

disp("The traffic cell assignments are: ");
for i = 1:cluster
    for j = 1:cluster
        num = ceil(ch_ls(i)/randsample(1,2,3,4,5));
        %disp(num);
        cellh= randsample(highp_ch,num);
        celll=randsample(lowp_ch,ch_ls(i) - num);
        cell = [cellh celll];
    end
    highp_ch = setdiff(highp_ch,cellh);
    lowp_ch= setdiff(lowp_ch,celll);
    if length(cell)< cluster
        zero=cluster - length(cell);
        %disp(zero);
        for k = 1:length(zero)
            cell = [cell, zeros(1,zero)];
        
         end 
    end
    disp(cell);
     
   end
        
    
    


