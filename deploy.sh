cd codecode
git pull
hugo --baseUrl='/'
sudo rm -rf /var/www/html/*
sudo cp -R public/* /var/www/html/