data=importdata('wine.data');
TotalNo=size(data,1);
data=data(randperm(TotalNo),:);
fID=fopen('Shuffled_wine.data','w');
for i=1:TotalNo
for j=1:14
    fprintf(fID,'%.2f ',data(i,j));
end
fprintf(fID,'\n');
end
fclose(fID);
