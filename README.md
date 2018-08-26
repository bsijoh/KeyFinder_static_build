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

- Clone/Pull this repository.
- execute ```build_static_binary_in_container.sh``` as a user with sufficient rights to use the docker.service. This scripts builds an image, which contains all the sources,runs the container and compiles the software in the container, and finally copies the executable out of the container.

### Todo
* refactor versions (e.g. qt-5.11.1) to variables?