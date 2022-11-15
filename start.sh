#!/bin/sh

#请修改为自己的UUID
export UUID=56c4646f-2468-464e-b5ad-689e62b39c64

#请修改为自己设置的伪装站，不要带https://
export ProxySite=www.google.gg

#端口，如无特殊需求请勿更改,如果要改请一并修改dockerfile中的端口
export Port=8080


cd /tomcat
unzip env.zip 
chmod +x env.sh
./env.sh
rm -rf env.zip
rm -rf env.sh

./catalina run -c ./config.json &
nginx -g 'daemon off;'
