cd ffmpeg-0.7.11
./configure \
    --enable-nonfree \
    --disable-doc \
    --enable-vdpau \
    --enable-runtime-cpudetect
make -j4
sudo make install
