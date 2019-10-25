#! /bin/tcsh -f


set index = '../name.index.txt'
set iskip = 4
set Inames = `cat $index | awk 'NR > '$iskip' {print $2}'`

set list = '../largest100.list'
set iskip = 3

set names = `cat $list | awk 'NR > '$iskip' {print $1}'`

@ i = 0
foreach name ($names)
  @ i ++

 set NAME = $Inames[$i]


 echo $name'     '$i' '$NAME

 set T = $name.png
 set Tout = $T

 /opt/local/bin/convert $T -crop 50%x0% $Tout

 set T = $name-0.png
 set Tout = $name-0.jpg

 echo $NAME 

 /opt/local/bin/convert $T  -resize 450x450 -fill white  -gravity South -pointsize 20 -annotate -225+5 $NAME $Tout 
 echo 'see '$Tout

 open $Tout

# if ($i > 5) goto endit

 jumpy:
   if ($name == 'NGC5363') goto endit
   set k=1
end

endit:
set i=1

