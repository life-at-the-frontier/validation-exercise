## 0x could we simply just copy and rename the maps we use 


## example copy

dir.create('copy')

?file.copy
file.copy(from = 'output maps/renderPair1.html', to = 'copy')

## rename
?file.rename
file.rename(from = 'copy/renderPair1.html', to = 'copy/dave.html')

## rename seems to also move the file ;S -- so we need the full filepath