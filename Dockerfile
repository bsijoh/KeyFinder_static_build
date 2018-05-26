FROM opensuse/leap:42.3

LABEL description="Image to try static build of keyfinder."

ARG user
ARG uid

# these default values are used, if not provided while running build script

######## CREATE USER
RUN zypper --non-interactive in sudo
RUN useradd --create-home --shell /bin/bash --uid $uid $user --groups users
RUN echo "$user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


# install devel-packages and build-tools for graph_tool
RUN zypper --non-interactive install \
    git \
    wget \
    curl \
    vim
    
RUN zypper --non-interactive install --type pattern devel_basis

RUN zypper --non-interactive install \
    cmake \
    gcc-c++

# setup build directory
ADD BUILD /home/$user/BUILD

# Add resources
WORKDIR /home/$user/BUILD

# zlib
WORKDIR /home/$user/BUILD/zlib_static
RUN sh ./get_zlib.sh


# qt5
# note: configuring qt fails if which is not installed!
# which is used to find perl/make
RUN zypper --non-interactive install \
    perl \
    python3 \
    which \
    Mesa-libGLESv3-devel \
    Mesa-libGLESv2-devel \
    glibc-locale \
    glibc-utils
WORKDIR /home/$user/BUILD/qt5_static

RUN sh ./get_qt5.sh

# fftw
RUN zypper --non-interactive install \
    ocaml \
    ocaml-ocamlbuild \
    autoconf \
    automake \
    indent \
    libtool
WORKDIR /home/$user/BUILD/fftw_static
RUN sh ./get_fftw.sh


# taglib
WORKDIR /home/$user/BUILD/taglib_static
RUN sh ./get_taglib.sh

# ffmpeg
RUN zypper --non-interactive install \
    yasm
WORKDIR /home/$user/BUILD/ffmpeg_static
RUN sh ./get_ffmpeg.sh

# libKeyFinder_static
WORKDIR /home/$user/BUILD/libKeyFinder_static
RUN sh ./get_libkeyfinder.sh

# KeyFinderGui
WORKDIR /home/$user/BUILD/KeyFinderGui_static
RUN sh ./get_keyfinder.sh

# reset USER and WORKDIR
RUN chown $user:users -R /home/$user/BUILD

USER $user
WORKDIR /home/$user


ENTRYPOINT ["/bin/bash"]



