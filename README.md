
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

4. Build vcmipidemo and vcimgnetsrv. You can find the built binaries in the ```src``` directory.
   ```
     $ ./build.sh --all
   ```

# Usage
The demo per default outputs as ascii art. Call the demo with the command line option -? to see other outputs:
``` 
  $ ./vcmipidemo -?
```
If you cannot see anything, try to set the shutter and gain values.

## Image streaming via network
If your have a headless hardware setup, you can stream the image via network by using the VCImgNetSrv and VCImgNetClient.

1. Install the frontend on Windows 10
   1. Copy vcimgnetclient.py to a folder on the windows pc.
   2. Download and Install [python-2.7.11.msi](https://www.python.org/ftp/python/2.7.11/python-2.7.11.msi)
   3. Download and Install [pygtk-all-in-one-2.24.2.win32-py2.7.msi](https://download.gnome.org/binaries/win32/pygtk/2.24/pygtk-all-in-one-2.24.2.win32-py2.7.msi)
   4. Do not start the python script yet!

2. Open a new terminal to the target and start the vcimgnetsrv. The server starts to listen for the connection from the VCImgNetClient.
      ```
        $ ssh root@<target-ip>
        # ./vcimgnetsrv
        Start VC Image Net Server ...
        Listen on port 2002
      ```
3. Execute the python script **vcimgnetclient.py**. 
   * The window from the VCImgNetClient should show up. 
   * Choose e.g. option _Interpete as RGB_
   * Click the **Receive Image** Button.
   * In the first terminal you should see that the client had connected to the server.
     ```
       # ./vcimgnetsrv
       Start VC Image Net Server ...
       Listen on port 2002
       Client connected!
     ```
    * The plain gray mainframe in the VCImgNetClient window should change to a diagonal hatched pattern. 
      A moving bar shows that the app is waiting to receive image data.   
      
 4. Open a second terminal and start the vcmipidemo to start the image stream. The application starts streaming 
    and should show some image information and the first few bytes from the image.
    **Please note the option -ax6 to suppress ASCII output and the option to output image informations and apply the 6 bit shift correction** 
    ```
      $ ssh root@<target-ip>
      # ./vcmipidemo -ax6 -s 10000 -g 10                  
      [#0001, ts: 337321, t:   0 ms] (dx: 1920, dy: 1080, pitch: 3840) - 9024 5022 f025 0022 7024 a022 0025 4022 2025 b022 
      [#0002, ts: 337338, t:  17 ms] (dx: 1920, dy: 1080, pitch: 3840) - 4025 7021 b024 7022 1025 1022 9025 8022 2025 7022 
      [#0003, ts: 337354, t:  16 ms] (dx: 1920, dy: 1080, pitch: 3840) - 0025 f021 8024 d022 2025 5022 e024 7022 6025 1022 
      [#0004, ts: 337387, t:  17 ms] (dx: 1920, dy: 1080, pitch: 3840) - e024 7022 6025 4022 4024 4022 f024 c022 d024 e021
      ...
    ```
    On Windows you can see the live image stream.
