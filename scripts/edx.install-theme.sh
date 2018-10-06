#!/bin/bash

rm -rf edx.config-atentamente

git clone https://github.com/atentamente/edx.config-figures.git
chown edxapp -R edx.config-figures
chgrp edxapp -R edx.config-figures

cp /home/ubuntu/edx.config-figures/conf/lms.env.json /edx/app/edxapp/lms.env.json
cp /home/ubuntu/edx.config-figures/conf/lms.auth.json /edx/app/edxapp/lms.auth.json
cp /home/ubuntu/edx.config-figures/conf/cms.env.json /edx/app/edxapp/cms.env.json
cp /home/ubuntu/edx.config-figures/conf/cms.auth.json /edx/app/edxapp/cms.auth.json

chmod 644 /edx/app/edxapp/*.env.json
chmod 755 /edx/app/edxapp/*.auth.json
