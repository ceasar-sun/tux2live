#!/bin/sh

######################################################
# Author: Ceasar Sun
# Description: Package and release toolkit for latest version from svn repository then 
# Where to get this: http://free.nchc.org.tw/svn/fslab/utility.shell/4tux2live/tux2live-release.sh 
# Usage: bash ./tux2live-release.sh
######################################################

export LC_ALL=C

RELVER=
CURRENT_PATH=`pwd`
WORKDIR=`mktemp -d /tmp/pack.tmp.XXXXXX`
PACKNAME=tux2live
REPOS_URL=http://free.nchc.org.tw/svn/tux2live/trunk

cd $WORKDIR

PACKVER="$(svn info $REPOS_URL | grep 'Last Changed Rev'| awk -F ": " '{print $2}' )"

echo "Packaging $PACKNAME version: $PACKVER ..."

echo "run : svn export $REPOS_URL to $WORKDIR/$PACKNAME"
svn export -q http://free.nchc.org.tw/svn/tux2live/trunk $PACKNAME

RELVER="$(grep '_TUX2LIVE_VERSION=' tux2live/conf/tux2live.conf | awk -F '=' '{print $2}' | sed -e 's/\s//g')"

echo "write version information into config file:  $PACKNAME/conf/tux2live.conf"
sed -i -e "s/^_TUX2LIVE_VERSION=.*/_TUX2LIVE_VERSION=$RELVER-$PACKVER/g" $PACKNAME/conf/tux2live.conf

echo "run : tar czf tux2live-v$RELVER-$PACKVER.tgz $PACKNAME"
tar czf tux2live-v$RELVER-$PACKVER.tgz $PACKNAME
mv tux2live-v$RELVER-$PACKVER.tgz $CURRENT_PATH

cd $CURRENT_PATH
if [ -d ../../doc/ ] && [ -w ../../doc/ ] ; then
	rsync -a $WORKDIR/$PACKNAME/doc/ ../../doc/
fi

if [ -f ./MD5SUMS ] ; then
	md5sum drbl-winroll-*-setup.zip > MD5SUMS
fi

[ -d "$WORKDIR" ] && rm -rf $WORKDIR

