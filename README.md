lemonpos.deb
============

Files needed to create debian package from content of lemonpos

## Generating deb package
Just call genpkg.sh script :)
```
genpkg.sh
```

## Dependencies needed to build lemon package
```
sudo apt-get install vim-nox openssh-server
sudo apt-get install git
sudo apt-get install build-essential g++ cmake gettext libqt4-sql-mysql kdelibs5-dev
sudo apt-get install devscripts debhelper autotools-dev
```

## Getting the sources
```
sudo apt-get install git
# download master branch
# other repos are:
# https://github.com/miguelchavez/lemonpos.git
# https://git.gitorious.org/lemonpos/lemonpos.git (see https://gitorious.org/lemonpos/lemonpos)
git clone https://github.com/kbaransk/lemonpos
cd lemonpos/
# download changes in persa branch
git fetch origin persa:persa
# switch to persa branch
git checkout persa

# update branch with gitorious changes
git pull origin persa
```
or a little bit easier (assumming real branch which is default one):
```
git clone https://github.com/kbaransk/lemonpos
```

## Preparation to compilation
Install the folowing packages:
* build-essential
* CMake
* g++
* gettext
* libqt4-sql-mysql
* kdelibs5-dev
For Debian / Ubuntu you should be able to install them using this command:
```
sudo apt-get install build-essential g++ cmake gettext libqt4-sql-mysql kdelibs5-dev
```

## Installation Guide
Assumming that you have sources cloned into lemonpos directory
```
cd lemonpos
mkdir build
cd build

# generate makefiles
cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`

# compile
make

# install
sudo make install

# uninstall
sudo make uninstall
```

## Database creation
```
# you're still in build directory
mysql -uroot -p < ../lemonpos/database_resources/lemon_mysql.sql

# the second one is not required currently
mysql -uroot -p < ../lemonpos/database_resources/mexico_taxes.sql
```

## Using system
You'll be asked to provide database name, user and password - you can probably leave default values.
You can sign in using *admin* user and *linux* password.

## Sources
* https://web.archive.org/web/20140330062708/http://sourceforge.net/apps/mediawiki/lemonpos/index.php?title=Installation_Guide
* https://web.archive.org/web/20130919015146/http://sourceforge.net/apps/mediawiki/lemonpos/index.php?title=Ubuntu_Installation_Guide#The_default_user_and_password
* http://linuxconfig.org/easy-way-to-create-a-debian-package-and-local-package-repository

