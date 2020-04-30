#! /bin/sh

URL=http://www.python.org/ftp/python

if [ $# < 1 ]
  then
    echo "Usage : ./install_python.sh python-version <custom_path:optional>"
    echo "Example : ./install_python.sh 3.6.3"
    echo "Example : ./install_python.sh 3.6.3 /home/tuxae/python3.6.3"
  else
    py_version=$1
    prefix=$2
    if [ -f Python-$py_version.tgz ]; then
	echo "Python-$py_version.tgz exists! Have you already run this script ? Aborting..."
        exit 1
    fi
    if [ -d Python-$py_version ]; then
	echo "Folder Python-$py_version exists! Have you already run this script ? Aborting..."
        exit 1
    fi
    if [ -d ~/.localpython$py_version ]; then
	echo ".localpython$py_version exists! Have you already run this script ? Aborting..."
        exit 1
    fi
    echo "Downloading Python..."
    wget $URL/$py_version/Python-$py_version.tgz
    if [ $? -ne 0 ]; then
	echo "Unable to get Python from $URL"
	exit 1
    fi
    echo "Extracting Python..."
    tar -zxf Python-$py_version.tgz
    cd Python-$py_version
    mkdir ~/.localpython$py_version
    echo "Installation Python $py_version..."
    if [ -z "$prefix" ]
      then
        prefix=$HOME/.localpython$py_version
    fi
    ./configure --prefix=$prefix
    make
    make install
    echo
    echo
    echo "Installation done!"
    echo "You can now use python $py_version in a virtual environment."
    echo
    echo "Example when using python3 :"
    echo "virtualenv python-$py_version -p $prefix/bin/python3"
    echo "source python-$py_version/bin/activate"
fi
