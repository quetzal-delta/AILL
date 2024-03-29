sudo apt install libxinerama1 libxinerama-dev -y
sudo apt install cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev -y
sudo apt install meson libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev libpcre3 -y
sudo apt install rofi feh scrub kitty bspwm -y
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/kitty
mkdir ~/.config/polybar
mkdir ~/.config/picom
mkdir ~/.config/bin
### BSPWM SXHKD ###
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm
make
sudo make install
cd ..
cd sxhkd
make
sudo make install
cd ..
unzip Export.zip
cd Export
cp bspwmrc ~/.config/bspwm
cp sxhkdrc ~/.config/sxhkd

### POLYBAR ###
cd ..
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
### PICOM ###
cd ../../
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd /usr/local/share/fonts
sudo mv ~/AILL/Export/Hack.zip .
sudo unzip Hack.zip
sudo rm Hack.zip
cd ~/AILL
cd ~/.config/kitty
mv ~/AILL/Export/{kitty.conf,color.ini} .
cd ~/AILL/Export/polybar
cp -r * ~/.config/polybar
cd fonts
sudo cp * /usr/share/fonts/truetype
fc-cache -v
cd ~/AILL/Export
cp picom.conf ~/.config/picom
###Extras### 
cd bin
cp * ~/.config/bin/
cd ..
mkdir ~/.wallpapers
cp wallpaper0.png ~/.wallpapers
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb

echo -e "[=] Sistema Hack Instalado Con Exito en $USER \n    Tipo de Shell: $SHELL\n    FIN"