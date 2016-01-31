% 数字图像处理的MATLAB实现
% 例2.7 adapthisteqa函数的使用

function [] = adapthisteqTest()
    f = imread('./Resource/Fig0310(a)(Moon Phobos).tif');
    
    g1 = adapthisteq(f);
    g2 = adapthisteq(f, 'NumTiles', [25,25]);
    g3 = adapthisteq(f, 'NumTiles', [25 25], 'ClipLimit', 0.05);
    
    subplot(1,4,1), imshow(f), xlabel('(a)');
    subplot(1,4,2), imshow(g1), xlabel('(b)');
    subplot(1,4,3), imshow(g2), xlabel('(c)');
    subplot(1,4,4), imshow(g3), xlabel('(d)');
end