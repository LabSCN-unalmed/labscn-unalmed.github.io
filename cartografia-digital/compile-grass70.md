---
layout: curso
title: 'Compilar GRASS GIS 7 en Debian'
curso: 'cartografia-digital'
order: 3
---

Para compilar GRASS GIS 7 en Debian 'Jessie':

* Instalar paquetes necesarios:

~~~
sudo apt-get install cmake libboost-all-dev flex bison debhelper dpatch autoconf2.13 autotools-dev \
  python-dev g++ gcc gettext graphviz libcairo2-dev libfftw3-dev libfreetype6-dev \
  libgdal1h libgdal1-dev libglu1-mesa-dev libglw1-mesa-dev libncurses5-dev libproj-dev \
  libreadline-dev libtiff5-dev libwxgtk3.0-dev libxmu-dev libxmu-headers \
  libxt-dev mesa-common-dev proj-bin python-numpy python-wxgtk3.0 subversion wx-common \
  zlib1g-dev netcdf-bin libatlas-dev libgegl-dev opencl-headers ocl-icd-libopencl1 \
  libsqlite3-dev postgresql libnetcdf-dev libgeotiff-dev libblas-dev \
  libcanberra-gtk-module
~~~

* Descargar y compilar libLAS:

~~~
wget http://download.osgeo.org/liblas/libLAS-1.8.0.tar.bz2
tar xjf libLAS-1.8.0.tar.bz2
mkdir libLAS-1.8.0/makefiles
cd libLAS-1.8.0/makefiles
cmake -G "Unix Makefiles" ../
make
sudo make install
~~~

* Descargar y compilar GRASS 7:

~~~
wget http://grass.osgeo.org/grass70/source/grass-7.0.0.tar.gz
tar xzfv grass-7.0.0.tar.gz
cd grass-7.0.0
​CFLAGS="-g -Wall -Werror-implicit-function-declaration -fno-common -Wextra -Wunused" \
CXXFLAGS="-g -Wall"  \
./configure \
   --prefix=/usr/local \
   --with-gdal \
   --with-proj --with-proj-share=/usr/share \
   --with-glw --with-nls --with-readline \
   --with-cxx --enable-largefile \
   --with-freetype --with-freetype-includes=/usr/include/freetype2 \
   --with-sqlite --with-cairo --with-python=/usr/bin/python-config \
   --with-wxwidgets --with-geos --with-blas \
   --with-lapack-includes=/usr/lib/lapack --with-liblas \
   --with-netcdf=/usr/bin/nc-config --with-odbc=yes \
   --with-openmp=yes --with-pthread=yes --with-postgres=yes \
   --with-postgres-includes=/usr/include/postgresql \
   --with-postgres-libs=/usr/lib/postgresql \
   --with-mysql=yes --with-mysql-includes=/usr/include/mysql \
   --with-mysql-libs=/usr/lib/mysql
make -j2
sudo make install
~~~
