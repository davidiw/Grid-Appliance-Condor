#!/bin/bash
if [[ ! "$1" || ! "$2" ]]; then
  echo "Usage: build.sh path version"
  exit
fi

path=$1
version=$2

base_dir=condor_deb
package_dir=$base_dir/opt/condor
mkdir -p $package_dir
cp -axf $path/* $package_dir/.

debian_dir=$base_dir/DEBIAN
mkdir -p $debian_dir
cp condor_control $debian_dir/control
echo "Version: $version" >> $debian_dir/control

dpkg-deb -b $base_dir
rm -rf $base_dir
mv $base_dir.deb condor_$version.deb
