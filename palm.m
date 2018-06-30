%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          palm.m           %
%           John            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
%输入数据
%特征参数库
Palm=[8.305,7.32,7.685,5.633,5.75,8.555,1.7,1.645;...
    7.607,6.969,7.059,5.011,5.071,8.684,1.754,1.557;...
    7.045,6.225,6.555,4.217,4.715,7.82,1.715,1.47;...
    7.596,6.852,7.44,5.362,5.666,8.302,1.774,1.66;...
    8.08,7.08,7.645,5.437,5.57,8.65,1.765,1.64;...
    8.91,7.59,8.385,5.825,5.945,9.195,1.888,1.66];

%待识别矢量
C0=[8.318,7.229,7.683,5.808,5.687,8.469,1.694,1.694];
C1=[7.108,6.356,6.594,4.416,4.719,7.864,1.694,1.452];
C2=[7.621,6.774,7.251,4.895,5.081,8.574,1.826,1.72];
C=[C0; C1; C2];

%计算海明距离
HammingD=zeros(3,6);
for i=1:3
    for j=1:6
        HammingD(i,j)=sum(abs(C(i,:)-Palm(j,:)));
    end
end

%输出海明距离识别结果
fprintf('海明距离识别结果：\n');
for i=0:2
    fprintf('C%d属于R%d类，其海明距离为%f\n',i,find(HammingD(i+1,:)==min(HammingD(i+1,:))),min(HammingD(i+1,:)));
end


%计算欧式距离
euclideanD=zeros(3,6);
for i = 1:3
    for j =1:6
        euclideanD(i,j)=norm(C(i,:)-Palm(j,:));
    end
end

%输出欧式距离识别结果
fprintf('欧式距离识别结果：\n');
for i=0:2
    fprintf('C%d属于R%d类，其欧式距离为%f\n',i,find(euclideanD(i+1,:)==min(euclideanD(i+1,:))),min(euclideanD(i+1,:)));
end


%计算切比雪夫距离
ChebyshevD=zeros(3,6);
for i = 1:3
    for j =1:6
        ChebyshevD(i,j)=max(abs(C(i,:)-Palm(j,:)));
    end
end

%输出切比雪夫距离识别结果
fprintf('切比雪夫距离识别结果：\n');
for i=0:2
    fprintf('C%d属于R%d类，其切比雪夫距离为%f\n',i,find(ChebyshevD(i+1,:)==min(ChebyshevD(i+1,:))),min(ChebyshevD(i+1,:)));
end






