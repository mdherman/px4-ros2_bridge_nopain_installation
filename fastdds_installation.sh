# Shell script for installing FastDDS
# ------------------------------------


sudo apt install openjdk-8-jdk -y

sudo update-alternatives --config java

sudo apt install zip -y

cd ~
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

mkdir ~/FastRTPS
cd ~/FastRTPS

git clone https://github.com/eProsima/foonathan_memory_vendor.git
cd foonathan_memory_vendor
mkdir build && cd build
sudo cmake ..
sudo cmake --build . --target install

git clone --recursive https://github.com/eProsima/Fast-DDS.git -b v2.0.0 ~/FastRTPS/FastDDS-2.0.0
cd ~/FastRTPS/FastDDS-2.0.0
mkdir build && cd build

sudo cmake -DTHIRDPARTY=ON -DSECURITY=ON ..
sudo make
sudo make install

git clone --recursive https://github.com/eProsima/Fast-DDS-Gen.git -b v1.0.4 ~/FastRTPS/Fast-RTPS-Gen
cd ~/FastRTPS/Fast-RTPS-Gen
sudo ./gradlew assemble
sudo ./gradlew install
