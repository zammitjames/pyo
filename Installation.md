# Dependencies #
To install pyo, you will need the following dependencies:
  * [Python 2.6.x or 2.7.x](http://www.python.org/download/releases/)
  * [WxPython 3.0](http://www.wxpython.org/download.php) (be sure to get the one matching your python architecture)
  * [portaudio](http://www.portaudio.com)
  * [portmidi](http://portmedia.sourceforge.net/portmidi/)
  * [libsndfile](http://www.mega-nerd.com/libsndfile)
  * [liblo](http://liblo.sourceforge.net/)
  * Ubuntu: python-tk (doesn't come installed by default on Ubuntu)
  * Ubuntu: python-dev package

Under Mac OS X, you can use Homebrew to retrieve necessary dependency librairies and headers (except for wxpython 3.0) to compile pyo.

First, install Homebrew with this command:

```
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

Then, install packages:

```
brew install python liblo libsndfile portaudio portmidi
```

# Get sources #
You can download pyo's source checking out the source code here:

```
svn checkout http://pyo.googlecode.com/svn/trunk/ pyo-read-only
```

# Compilation #
Please note that under Mac OS X you will need to install the developer tools to compile pyo.

Once you have all the required dependencies, go in pyo's directory:

```
cd pyo-read-only
```

You then need to build the extension:

```
sudo python setup.py install
```

## Compilation flags ##
If you want to be able to use coreaudio (Mac OS X):

```
--use-coreaudio
```

If you want JACK support (Linux, Mac OS X):

```
--use-jack
```

If you want to be able to use a 64-bit pyo (All platforms):

```
--use-double
```

(32-bit and 64-bit sample precision can live side-by-side without conflict)

To remove pyo's printing messages to the console:

```
--no-messages
```

To build pyo with custom externals:

```
--compile-externals
```

## Compilation scripts ##

To compile both 32-bit and 64-bit resolutions on linux:

```
sudo sh scripts/compile_linux_withJack.sh
```

To compile both 32-bit and 64-bit resolutions on OS X (without Jack):

```
sudo sh scripts/compile_OSX.sh
```

To compile both 32-bit and 64-bit resolutions on OS X (with Jack):

```
sudo sh scripts/compile_OSX_withJack.sh
```

# Debian-based distros #

Under Debian (Ubuntu) you can type the following commands to get pyo up and running:

```
sudo apt-get install libportmidi-dev portaudio19-dev liblo-dev libsndfile-dev python-dev python-tk subversion python-imaging-tk python-wxgtk2.8
svn checkout http://pyo.googlecode.com/svn/trunk/ pyo-read-only
cd pyo-read-only
sudo python setup.py install --install-layout=deb
```

From Ubuntu 14.04 (Trusty), pyo can be installed from the Synaptic Package Manager. Package name is "python-pyo".