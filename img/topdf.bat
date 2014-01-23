@ echo off
title EPS to PDF
cd
cls

for %%f in (*.eps) do call C:\texlive\2012\bin\win32\epstopdf.exe %%f

for %%f in (*.svg) do call "C:\Program Files (x86)\Inkscape\inkscape.exe" %%f --export-pdf=%%f.pdf