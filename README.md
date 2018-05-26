# Building Static KeyFinder Binary for Linux

## Dependencies:

* [zlib](https://github.com/madler/zlib)
* [fftw](http://www.fftw.org/download.html)
* [ffmpg](https://ffmpeg.org/releases/) release 0.7.11
* [taglib](https://github.com/taglib/taglib)
* [qt5](http://code.qt.io/cgit/qt/qt5.git/) or [qtbase](http://code.qt.io/cgit/qt/qtbase.git/)
* [libKeyFinder](https://github.com/ibsh/libKeyFinder)
* [is_KeyFinder](https://github.com/ibsh/is_KeyFinder)

## HowTo

- Build image with build_image.sh
- Run image and execute build_static.sh in container
- Copy executable out of container
 ```sudo docker cp <containername>:/home/<user>/BUILD/KeyFinderGui_static/is_KeyFinder/KeyFinder ./KeyFinder ```