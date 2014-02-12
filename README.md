papino
======

Springboard for radio astronomy software.

This is a set of tools for easily setting up various radio
astronomy software packages in virtual machines and isolated
environments on Linux and Mac.

All packages in the ska-sa Ubuntu PPA are available:

https://launchpad.net/~ska-sa/+archive/main


vagrant
-------

For OSX:

 * Download and install VirtualBox from: https://www.virtualbox.org/
 * Download and install Vagrant from: http://www.vagrantup.com/

For Ubuntu:

```shell
$ install apt-get install virtualbox vagrant git
```

To setup the Papino environment:

```shell
$ git clone https://github.com/ska-sa/papino
$ cd papino
$ vagrant up
```

Now you can point your browser to http://localhost:8888 to start
using an IPython environment with a lot of astro python packages 
installed.

more info:

http://docs.vagrantup.com/v2/getting-started/index.html


docker
------

Follow the instructions described here:

http://www.docker.io/gettingstarted/

and then run:
```shell
$ ./rundocker.sh
```

To download and run the trusted build image.

Alternativly you can build yourn own image
```shell
$ ./builddocker.sh
```

Now you can point your browser to http://localhost:8888 to start
using an IPython environment.

related
-------

There are also native OSX packages available for OSX homebrew:

https://github.com/ska-sa/homebrew-tap



