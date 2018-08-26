cd qt-everywhere-src-5.11.1
./configure -opensource -confirm-license -release -static -nomake examples -nomake tests
gmake -j4
sudo gmake install
