#!/bin/bash

rm -rf edx.config-figures
rm -rf /edx/app/edxapp/edx-platform/themes/atentamente

git clone https://github.com/atentamente/edx.config-figures.git
chown edxapp -R edx.config-figures
chgrp www-data -R edx.config-figures

# Install json config files
cp /home/ubuntu/edx.config-figures/conf/lms.env.json /edx/app/edxapp/lms.env.json
cp /home/ubuntu/edx.config-figures/conf/lms.auth.json /edx/app/edxapp/lms.auth.json
cp /home/ubuntu/edx.config-figures/conf/cms.env.json /edx/app/edxapp/cms.env.json
cp /home/ubuntu/edx.config-figures/conf/cms.auth.json /edx/app/edxapp/cms.auth.json

chmod 644 /edx/app/edxapp/*.env.json
chmod 755 /edx/app/edxapp/*.auth.json

# Install custom themes
sudo cp -R /home/ubuntu/edx.config-figures/themes /edx/app/edxapp/edx-platform/
sudo chown edxapp -R /edx/app/edxapp/edx-platform/themes
sudo chgrp edxapp -R /edx/app/edxapp/edx-platform/themes

echo .............................
echo Install Figures configuration
echo .............................
cp /home/ubuntu/edx.config-figures/lms/envs/aws.py /edx/app/edxapp/edx-platform/lms/envs/
cp /home/ubuntu/edx.config-figures/lms/urls.py /edx/app/edxapp/edx-platform/lms/

sudo chown -R edxapp /edx/app/edxapp/edx-platform/lms/
sudo chgrp -R edxapp /edx/app/edxapp/edx-platform/lms/


/edx/bin/supervisorctl restart lms
/edx/bin/supervisorctl restart cms
/edx/bin/supervisorctl restart edxapp_worker:
