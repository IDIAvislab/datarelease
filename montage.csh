#! /bin/tcsh -f

# montage NGC1055-0.jpg J1329-17-0.jpg NGC4192-0.jpg NGC2997-0.jpg NGC6503-0.jpg NGC4125-0.jpg NGC7793-0.jpg NGC5363-0.jpg -geometry +4+2 test.jpg

set list = '../largest100.list'
set iskip = 3

set names = `cat $list | awk 'NR > '$iskip' {print $1}'`

@ i = 0
@ icount = 0
@ set = 0

set string = 'lmc.jpg smc.jpg m31.jpg m33.jpg'
@ icount = 4

foreach name ($names)
  @ i ++

 echo $name'     '$i

 set T =  $name-0.jpg


 if ($icount < 20) then
    set string = "$string $T"
    @ icount ++
 else
    
    @ icount = 0
    set out = 'montage_'$set'.jpg'
    echo $string
    /opt/local/bin/montage $string -geometry +1+1+450x450 -tile 4x5 $out
    open $out

#    if ($set == 0) goto endit

    @ set ++
    @ icount ++
    set string = $T
  endif

 jumpy:
#   if ($name == 'NGC5363') goto endit
   set k=1
end

endit:
set i=1

