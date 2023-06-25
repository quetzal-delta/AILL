echo -e """\e[0;35m
   ▄████████  ▄█   ▄█        ▄█       
  ███    ███ ███  ███       ███       
  ███    ███ ███▌ ███       ███       
  ███    ███ ███▌ ███       ███       
▀███████████ ███▌ ███       ███       \e[1;32m@Quetzal-H4ck\e[0m \e[0;31mV0.1\e[0m\e[1;35m
  ███    ███ ███  ███       ███       
  ███    ███ ███  ███▌    ▄ ███▌    ▄ 
  ███    █▀  █▀   █████▄▄██ █████▄▄██ 
                  ▀         ▀     
\e[0m"""

# Dirs
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"
PDIR="$HOME/.config/polybar"

echo -e "\e[44mInstalando Base"
sudo parrot-upgrade
sudo apt install build-essential rofi kitty git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev -y
sudo apt install libxinerama1 libxinerama-dev -y
sudo apt install meson feh libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre2-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev libxcb-glx0-dev -y
sudo apt install zsh bat cmake cmake-data pkg-config python3-sphinx libcairo2-dev libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev libjsoncpp-dev libmpdclient-dev libuv1-dev libnl-genl-3-dev -y
sudo parrot-upgrade

echo -e " \e[42mInstalando Base"
unzip Export.zip
git clone https://github.com/baskerville/bspwm.git
git clone https://github.com/baskerville/sxhkd.git
cd bspwm
make
sudo make install
cd ..
cd sxhkd
make
sudo make install
mkdir ~/.config/{bspwm,sxhkd}
cd ../
cd Export
cp bspwmrc ~/.config/bspwm/
cp sxhkdrc ~/.config/sxhkd/
mkdir ~/.config/bspwm/scripts/
cp bspwm_resize ~/.config/bspwm/scripts/
chmod +x ~/.config/bspwm/scripts/bspwm_resize
sudo apt install bspwm

echo -e " \e[1;35mInstalando Polybar"
cd ../
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
sudo make install
rm -r ~/.config/polybar/
cd ../../
cd Export
cp -r polybar ~/.config/
cp -r bin  ~/.config/
echo -e "\n[*] Installing fonts..."
[[ ! -d "$FDIR" ]] && mkdir -p "$FDIR"
cp -rf $DIR/Export/fonts/* "$FDIR"
fc-cache -v

echo -e " \e[1;33mInstalando Picom"

cd ../
git clone https://github.com/ibhagwan/picom.git
cd picom
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install

echo -e " \e[0;36mInstalando Extras"

cd ../
mkdir ~/.wallpapers
cp Export/wallpaper0.png ~/.wallpapers
mkdir ~/.config/picom
cp Export/picom.conf ~/.config/picom
mkdir ~/.config/kitty
mv Export/color.ini ~/.config/kitty/
mv Export/kitty.conf ~/.config/kitty/

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
cp Export/.p10k.zsh ~/$HOME
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.powerlevel10k
sudo echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >> /root/.zshrc
sudo cp Export/.p10k.zsh ~/root
sudo rm /root/.zshrc
sudo ln -l /root/.zshrc /$HOME/.zshrc
cp Export/zshrc_conf ~/.zshrc
cp Export/Hack.zip .
unzip Hack.zip
sudo mv *.ttf /usr/share/fonts
rm *.zip
wget https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd-musl_0.23.1_amd64.deb
sudo dpkg -i lsd-musl_0.23.1_amd64.deb
clear
echo -e """\e[0;35m
                  ¶                ¶
                 ¶¶                ¶¶
               ¶¶¶                  ¶¶¶
             ¶¶¶¶                    ¶¶¶¶
            ¶¶¶¶¶                    ¶¶¶¶¶
           ¶¶¶¶¶                      ¶¶¶¶¶
          ¶¶¶¶¶¶                      ¶¶¶¶¶¶
          ¶¶¶¶¶¶¶  ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶  ¶¶¶¶¶¶¶
          ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
           ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
            ¶¶¶¶¶¶¶¶    ¶¶¶¶¶¶    ¶¶¶¶¶¶¶¶
   ¶        ¶¶¶¶¶¶¶      ¶¶¶¶      ¶¶¶¶¶¶¶
   ¶       ¶¶¶¶¶¶¶¶   \e[0;31mO\e[0m\e[1;35m ¶¶¶¶¶  \e[0;31mO\e[0m\e[1;35m  ¶¶¶¶¶¶¶¶  \e[1;32m@Quetzal-H4ck\e[0m \e[0;31mV0.1\e[0m\e[1;35m
  ¶¶¶      ¶¶¶¶¶¶¶¶¶    ¶¶¶¶¶¶    ¶¶¶¶¶¶¶¶¶
  ¶¶¶     ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶
 ¶¶¶¶¶    ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶  ¶¶
 ¶¶¶¶¶    ¶¶¶  ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶  ¶¶¶
   ¶¶     ¶¶¶  ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶  ¶¶¶
   ¶¶      ¶¶¶     ¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶     ¶¶
    ¶¶      ¶¶        ¶¶¶¶¶¶¶¶¶¶       ¶¶
     ¶¶      ¶¶¶                       ¶
     ¶¶        ¶¶    ¶¶¶¶¶¶¶¶¶¶¶      ¶
      ¶¶        ¶¶¶     ¶¶¶¶¶¶¶¶¶¶¶  ¶
       ¶¶          ¶¶¶     ¶¶¶¶¶¶¶¶¶¶
         ¶¶           ¶¶¶¶¶  ¶¶¶¶¶¶¶¶¶
                             ¶¶¶¶¶¶¶¶¶¶
                              ¶¶¶¶¶¶¶¶¶
                               ¶¶¶¶¶¶¶¶
\e[0m"""

