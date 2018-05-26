cd fftw-3.3.7
cmake -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTS=OFF -DCMAKE_BUILD_TYPE=Release .
make -j4
sudo make install
