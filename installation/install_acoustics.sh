#!/bin/sh

# Acoustics Dependencies
RIPDEP=~/osu-uwrt/riptide_dependencies

# Setup libokFrontPanel for FPGA
cd ${RIPDEP}/src/installation/tar_files/
tar -zxf FrontPanel-Ubuntu16.04LTS-x64-5.0.2.tgz
cd FrontPanel-Ubuntu16.04LTS-x64-5.0.2
chmod +x install.sh
sudo ./install.sh
sudo cp API/libokFrontPanel.so /usr/lib/
cd ..
rm -rf FrontPanel-Ubuntu16.04LTS-x64-5.0.2/
cd ..

# Install FFT Software
fft_version="fftw-3.3.8"
if [ -e "$fft_version.tar.gz" ]; then # Check if tar file exists on local machine
    echo -e "Skipping download of $fft_version.tar.gz\n"
else
    echo -e "Downloading $fft_version.tar.gz\n"
    wget ftp://ftp.fftw.org/pub/fftw/$fft_version.tar.gz
fi
tar -zxf $fft_version.tar.gz
cd $fft_version
sudo ./configure
sudo make
sudo make install
cd ..
rm $fft_version.tar.gz
sudo rm -rf $fft_version

echo "Installed acoustics dependencies"