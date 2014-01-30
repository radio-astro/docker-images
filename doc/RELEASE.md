How to make a new release
=========================

tarball
-------
 * clean up the source tree, make sure it is compiling etc.

 * go to https://github.com/ska-sa/lwimager/releases/new and make new release.
   Give it a proper tag name, like v1.3.0

package
-------

You need a Ubuntu or debian system. Also you need to have your
launchpad PPA developer enviroment configured. Read more about that here

https://help.launchpad.net/Packaging/PPA
https://help.launchpad.net/Packaging/PPA/Uploading

to build and upload a package:

 * install requirements (optional):

   $ sudo apt-get install git devscripts dput

 * download the tarball, which is named <tag>.tar.gz

 * rename the tarball to <packagename>_<version>.orig.tar.gz

 * extract the tarball (will be <packagename>-<version>

 * get the debian package files:
 
   $ cd <packagename-<version>

   $ git clone https://github.com/ska-sa/<package>-debian

 * make sure you are in the right branch. Idea is that every Ubuntu/Debian
   release has it own branch in the repo.

   $ git branch

 * increase the debian version number:

   $ dch 

   You can also manually update debian/changelog. Make sure the
   email adres is of a valid PPA maintainer and if the Ubuntu release
   is correct. Version number should be
   <version>-<packageversion><ubunturelease><packageversion>
   for example
   1.3.0-1precise1

 * commit your changes to the repository:

   $ pushd debian && git commit -a && popd

 * check if the package is building:

   $ dpkg-buildpackage

 * make a signed source package: 

   $ debuild -S -sa

 * upload the package:

   $ dput ppa:ska-sa/main ../<package>_<version>_source.changes

