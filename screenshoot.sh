#!/bin/bash
scrot  /tmp/screen.png
curl  -F "upload=yes" -F "filename=@/tmp/screen.png" http://www.radikal.ru/action.aspx | grep "input_link_1\"" | cut -d "\"" -f4 | tee -ai /var/log/screens.log | xsel -b -i ;
tail -n 1 /var/log/screens.log |  xargs -I _ google-chrome _ ;
notify-send "Загрузка скриншота" "Скриншот был успешно загружен" -i /usr/share/icons/gnome/scalable/emblems/emblem-default.svg -t 5000 ;

curl  -F "upload=yes" -F "file=@/tmp/screen.png" -L http://habrastorage.org/storage/habraeffect/05/68/056805cc524b8f502bd06f517fb65059.pngupload.php  | grep -e "original-link" |  awk -F"\"" '{print $10}' | tee -ai /var/log/screens.log | xsel -b -i ;
tail -n 1 /var/log/screens.log |  xargs -I _ google-chrome _ ;
notify-send "Загрузка скриншота" "Скриншот был успешно загружен" -i /usr/share/icons/gnome/scalable/emblems/emblem-default.svg -t 5000 ; 
