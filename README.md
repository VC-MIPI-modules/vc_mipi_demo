
# Vision Components MIPI CSI-2 demo software

## Prerequisites for cross-compiling
### Host PC
* Recommended OS is Ubuntu 18.04 LTS or Ubuntu 20.04 LTS
* You need git to clone this repository
* All other packages are installed by the scripts contained in this repository

# Installation

1. Create a directory and clone the repository   
   ```
     $ cd <working_dir>
     $ git clone https://github.com/pmliquify/vc_mipi_demo
   ```

3. Setup the toolchain.
   ```
     $ cd vc_mipi_demo/bin
     $ ./setup.sh --host
   ```

4. Build vcmipidemo and vcimgnetsrv.
   ```
     $ ./build.sh --all
   ```

## VCMipiDemo
The demo per default outputs as ascii art. Call the demo with the command line option -? to see other outputs:
``` 
  $ ./vcmipidemo -?
```
If you cannot see anything, try to set the shutter and gain values.

## Image streaming via network
If your have a headless hardware setup, you can stream the image via network by using the VCImgNetSrv and VCImgNetClient.

### VCImgNetClient
Install the vcmipidemo frontend on Windows 10

   1. Copy vcimgnetclient.py to a folder on the windows pc.
   2. Download and Install [python-2.7.11.msi](https://www.python.org/ftp/python/2.7.11/python-2.7.11.msi)
   3. Download and Install [pygtk-all-in-one-2.24.2.win32-py2.7.msi](https://download.gnome.org/binaries/win32/pygtk/2.24/pygtk-all-in-one-2.24.2.win32-py2.7.msi)

### VCImgNetSrv
Start vcimgnetsrv in the background once, then you can connect to it using  vcimgnetclient.py  (needs PyGTK). You can start vcimgnetsrv in the background by calling:

```
  $ ./vcimgnetsrv &
```
To stop it, you can use pkill:
```
  $ pkill vcimgnetsrv
```