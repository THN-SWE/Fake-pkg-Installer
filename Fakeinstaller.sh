# Define the list of known packages
#!/bin/bash

packages=(
  "apache2"
  "bash"
  "curl"
  "emacs"
  "ffmpeg"
  "gimp"
  "git"
  "gnome"
  "gnuplot"
  "grep"
  "gzip"
  "htop"
  "httpd"
  "inkscape"
  "java"
  "jupyter"
  "kafka"
  "kubernetes"
  "latex"
  "libreoffice"
  "linux"
  "make"
  "mongodb"
  "mysql"
  "nginx"
  "nodejs"
  "numpy"
  "opencv"
  "openssl"
  "pandas"
  "perl"
  "php"
  "postgresql"
  "puppet"
  "python"
  "redis"
  "ruby"
  "rust"
  "scala"
  "screen"
  "sed"
  "ssh"
  "sqlite"
  "subversion"
  "supervisor"
  "svn"
  "systemd"
  "tar"
  "tensorflow"
  "tesseract"
  "tmux"
  "ubuntu"
  "ufw"
  "unix"
  "vim"
  "virtualenv"
  "vsftpd"
  "wget"
  "wordpress"
  "x11"
  "xcode"
  "xml"
  "yarn"
  "yum"
  "zip"
  "zsh"
  "anaconda"
  "apache"
  "apt"
  "awk"
  "bashrc"
  "blender"
  "boost"
  "caffe"
  "conda"
  "cron"
  "cuda"
  "cups"
  "django"
  "docker"
  "elasticsearch"
  "fink"
  "flask"
  "fuse"
  "gcc"
  "gdal"
  "geos"
  "ghostscript"
  "gnome-shell"
  "gnupg"
  "go"
  "gradle"
  "graphviz"
  "gtk"
  "hadoop"
  "haproxy"
  "imagemagick"
  "iptables"
  "java8"
  "jenkins"
  "json"
  "kde"
  "kerberos"
  "kernel"
  "ksh"
  "latexmk"
  "libtool"
  "logrotate"
  "lua"
  "lxc"
  "mariadb"
  "matlab"
  "mercurial"
  "mod_wsgi"
  "modprobe"
  "mono"
  "nagios"
  "ncurses"
  "neovim"
  "nginx-extras"
  "nmap"
  "nvidia"
  "odoo"
  "openmpi"
  "openssl-devel"
  "pandoc"
  "perl5"
  "pgadmin"
  "php5"
  "php7"
  "phpmyadmin"
  "phpunit"
  "pki"
  "postfix"
  "presto"
  "procmail"
  "proftpd"
  "protobuf"
  "pycharm"
  "pyqt"
  "pytorch"
  "qemu"
  "qt"
  "r"
  "rabbitmq"
  "rails"
  "rake"
  "ranger"
  "rclone"
  "redis-server"
  "rkhunter"
  "rpm"
  "rsync"
  "rubygems"
  "samba"
  "scons"
  "selenium"
 
)
#percentBar animation
percentBar ()  { 
    local prct totlen=$((8*$2)) lastchar barstring blankstring;
    printf -v prct %.2f "$1"
    ((prct=10#${prct/.}*totlen/10000, prct%8)) &&
        printf -v lastchar '\\U258%X' $(( 16 - prct%8 )) ||
            lastchar=''
    printf -v barstring '%*s' $((prct/8)) ''
    printf -v barstring '%b' "${barstring// /\\U2588}$lastchar"
    printf -v blankstring '%*s' $(((totlen-prct)/8)) ''
    printf -v "$3" '%s%s' "$barstring" "$blankstring"
}

# fake package name here !
pkg=xyz

echo "Installing Requirments ..."

#number of dependencies to install
n=10

#let loading time t
t=.01

#let loading bar width w
w=30

#Randomly select n packages from the list
selected_packages=($(shuf -e "${packages[@]}" | head -n $n))

#installation of the selected dependencies
for package in "${selected_packages[@]}"; do
  echo "Installing $package..."
  sleep 1
  
    for i in {0..10000..33} 10000;do i=0$i
        printf -v p %0.2f ${i::-2}.${i: -2}
        percentBar $p $((COLUMNS-$w)) bar
        printf '\r|%s|%6.2f%%' "$bar" $p
        read -srt $t _ && break    # console sleep avoiding fork
    done
    
    # Generate a random string 
    # length is the random string size
    length=500
    random_string=$(tr -dc '[:graph:]' < /dev/urandom | fold -w $length | head -n 1)

    echo $random_string


  echo " $package installed"
  echo ==============================================================================
done

#installation is complete
echo "All dependencies installed"
echo "Installing package ${pkg}..."
echo "${pkg} is Succsessfully Installed !"
