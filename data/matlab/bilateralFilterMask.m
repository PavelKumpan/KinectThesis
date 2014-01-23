clc;
clear all;

m_size = 64;
sigma = 0.2;


m_step = zeros(m_size);

m_step(:, 1:(m_size / 2)) = m_step(:, 1:(m_size / 2)) + sigma;
m_step(:, (m_size / 2):m_size) = m_step(:, (m_size / 2):m_size) + 1 - sigma;
m_step = m_step + (rand(m_size) .* sigma - sigma);


gaussianFilter = fspecial('gaussian',[3 3], 0.5);
m_step = imfilter(m_step, gaussianFilter, 'replicate');

subplot(3,2,[1 2]);
h1 = surf(m_step);
title('3D reprezentace hrany v obraze');

%% Vyhlazení gaussovským filtrem

gaussianFilter = fspecial('gaussian',[32 32], 5);
gauss_step = imfilter(m_step, gaussianFilter, 'replicate');

subplot(3,2,3);
h2 = surf(gauss_step);
title('Hrana po aplikaci Gaussovského rozostøení');

subplot(3,2,5);
h3 = surf(gaussianFilter);
title('Maska Gaussovského rozostøení');

%% Vyhlazení Bilaterálním filtrem

bil_step = bfilter2(m_step, 16, [10, 0.25]);

subplot(3,2,4);
h4 = surf(bil_step);
title('Hrana po aplikaci Bilaterálního filtru');
matlab2tikz('edge.tex');
