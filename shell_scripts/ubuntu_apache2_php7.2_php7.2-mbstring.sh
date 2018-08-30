#!/bin/bash
sudo apt update
sudo apt upgrade -y
if [ $? -eq 0 ]; then
  echo "All packages are up to date."
  sleep 2
  sudo apt install apache2 -y
  if [ $? -eq 0 ]; then
    echo "Apache is installed."
    apache2 -v
    sleep 2
    sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe"
    if [ $? -eq 0 ]; then
      sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-security main universe"
      if [ $? -eq 0 ]; then
        sudo add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc)-updates main universe"
        if [ $? -eq 0 ]; then
          echo "Ubuntu $(lsb_release -sc) main universe repository is enabled."
          sleep 2
          sudo apt update
          sudo apt upgrade -y
          sudo apt install -y ssh php7.2 php7.2-common php-pear php7.2-curl php7.2-cgi php7.2-mbstring
          if [ $? -eq 0 ]; then
            echo "Everything is done!"
          else
            echo "Something was broken! Please try again."
          fi
        fi
      fi
    fi
  fi
fi