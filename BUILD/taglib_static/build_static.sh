cd taglib
cmake -DENABLE_STATIC_RUNTIME=ON -DCMAKE_BUILD_TYPE=Release .
make -j4
sudo make install
