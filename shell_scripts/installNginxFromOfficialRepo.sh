# Install a pre-built Ubuntu package from the Official NGINX Repository
curl -sL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

if [ $? -eq 0 ]; then
  # Latest stable version
  sudo add-apt-repository "deb https://nginx.org/packages/ubuntu/ $(lsb_release -sc) nginx"

  if [ $? -eq 0 ]; then
  # Install NGINX Open Source
  sudo apt update
  sudo apt install nginx

    if [ $? -eq 0 ]; then
    # Start NGINX and is enabled to start automatically on reboot
    sudo systemctl start nginx
    sudo systemctl enable nginx
	
	  if [ $? -eq 0 ]; then
	  echo "NGINX is installed and running."
	  nginx -v
	  fi
	fi
  fi
fi