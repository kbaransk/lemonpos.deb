#!/bin/bash

CHECKOUTDIR=lemonpos
WORKDIR=out
UPSTREAM_VERSION=0.9.9

rm -fr   $WORKDIR
mkdir -p $WORKDIR


if [ ! -d $CHECKOUTDIR ]
then
	git clone https://github.com/kbaransk/lemonpos $CHECKOUTDIR
	#git clone git@github.com:kbaransk/lemonpos.git $CHECKOUTDIR
	pushd $CHECKOUTDIR
		git checkout tags/lemonpos-fast_${UPSTREAM_VERSION}
	popd
fi

tar -czf $WORKDIR/lemonpos-fast_${UPSTREAM_VERSION}.orig.tar.gz --exclude .git --exclude .gitignore lemonpos
cp -a lemonpos $WORKDIR/lemonpos
cp -a debian $WORKDIR/lemonpos/debian
rm -fr $WORKDIR/lemonpos/.git

pushd $WORKDIR/lemonpos


#LC_ALL=C dpkg-buildpackage -b -rfakeroot -us -uc
LC_ALL=C debuild -us -uc

popd
