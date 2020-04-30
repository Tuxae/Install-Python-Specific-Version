## Usage

```bash
chmod u+x install_python.sh
apt install make gcc zlib1g-dev libffi-dev
#Exemple
./install_python.sh 3.6.4
```

Python folder will be installed in `$HOME/.localpython3.6.4` in this example. You can then use

```bash
$HOME/.localpython3.6.4/bin/python3
$HOME/.localpython3.6.4/bin/pip3
```

## Install a specific version of Python on your system (without root)

Whether you want to install a specific version of Python on a shared hosting environment, 
you want to use another version in a virtual environment, 
or you want to add a new kernel to your Jupyter
you can use this shell script.
