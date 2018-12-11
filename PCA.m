II = zeros(4000,550);
for k = 0:549 
    name = strjoin({'pos-',int2str(k),'.png'},'');
    %fprintf('%s\n',name);
    I = imread(strjoin({'./CarData/',name},''));
    II(:,k+1) = I(:)';
end

%Aplicar PCA, para esto se obtienen los eigenvectores de la matriz de
%covarianza

S = cov(II');
[V,D] = eig(S);
PC = V(:,3985:4000);

for k = 1:16
    name = strjoin({'./PCA16/PC-',int2str(17-k),'.png'},'');
    i = PC(:,k);
    i = i + abs(min(i));
    i = 255*(i/max(i));
    i = round(i);
    i = uint8(reshape(i,[40 100]));
    imwrite(i,name);
end