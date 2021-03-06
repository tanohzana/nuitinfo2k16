#!/bin/bash

set -e

cd /var/www/ndi

if [[ -e nuitinfo2k16 ]];
then
    # backup
    mv nuitinfo2k16 nuitinfo2k16_$(date '+%Y-%m-%d_%H:%M:%S')
fi

# getting the new code
git clone https://github.com/iTeam-org/nuitinfo2k16.git

cd nuitinfo2k16

# add prod conf file
cp ~/app.prod.php /var/www/ndi/nuitinfo2k16/app/config/app.default.php

cd app

# install deps
composer install -n

# To be used in config/app.php to disable debug mode
export CAKE_PHPDEBUG=0
