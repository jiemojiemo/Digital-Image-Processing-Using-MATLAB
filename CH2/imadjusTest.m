% 数字图像处理的MATLAB实现
% 例2.1 imadjust函数与strechlim函数

function [] = imadjusTest()
f = imread('./Resource/Fig0303(a)(breast).tif');
g1 = imadjust(f, [], [1,0]);
g2 = imadjust(f, [0.5,0.75], [1,0]);
g3 = imadjust(f, [], [], 2);
g4 = imadjust(f, stretchlim(f), [0,1]);
g5 = imadjust(f, stretchlim(f), [1,0]);

% 绘制图片
subplot(2,3,1),imshow(f),xlabel('(a)');
subplot(2,3,2),imshow(g1),xlabel('(b)');
subplot(2,3,3),imshow(g2),xlabel('(c)');
subplot(2,3,4),imshow(g3),xlabel('(d)');
subplot(2,3,5),imshow(g4),xlabel('(e)');
subplot(2,3,6),imshow(g5),xlabel('(f)');
end