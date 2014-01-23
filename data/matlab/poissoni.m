clc;
clear all;

poisson = imread('poissonDisk.gif');
[m n] = size(poisson);

randomi = ones(m, m);
poisson = ~poisson;

blacksum = sum(poisson(:)) / 3



for i = 1:(blacksum)
    randomi(randi(m), randi(m), :) = 0;
end;


imwrite(randomi,'random.png');
imshow(randomi);


% grid
grid = ones(m, m);
s = floor(sqrt(blacksum))^2;
cellSize = ceil(m / sqrt(s));
x = 0;
y = 0;
for i = 1:s
    grid(x + ceil(cellSize / 2), y + ceil(cellSize / 2), :) = 0;
    x = x + cellSize;
    if x > (m - cellSize / 2)
        x = 0;
        y = y + cellSize;
    end;
end;

grid = grid(:, 1:m);
imwrite(grid,'grid.png');
imwrite(poisson,'poissonDisk.png');
%imshow(grid);

sum(~grid(:))
sum(~randomi(:))
sum(poisson(:))