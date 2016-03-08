clear all;
clc;

f = imread('./Resource/Fig0315(a)(original_test_pattern).tif');
f=im2double(f);
w = ones(31);
g1 = imfilter(f,w);
g1 = g1./max(max(g1));

g2 = imfilter(f,w,'replicate');
g2 = g2./max(max(g2));
g3 = imfilter(f,w,'symmetric');
g3 = g3./max(max(g3));
g4 = imfilter(f,w,'circular');
g4 = g4./max(max(g4));
f8 = im2uint8(f);
g5 = imfilter(f,w,'replicate');

% ªÊ÷∆Õº∆¨
subplot(2,3,1),imshow(f),xlabel('(a)');
subplot(2,3,2),imshow(g1),xlabel('(b)');
subplot(2,3,3),imshow(g2),xlabel('(c)');
subplot(2,3,4),imshow(g3),xlabel('(d)');
subplot(2,3,5),imshow(g4),xlabel('(e)');
subplot(2,3,6),imshow(g5),xlabel('(f)');