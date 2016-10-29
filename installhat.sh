#yum install gcc python-devel gcc-gfortran redhat-rpm-config gcc-c++ libjpeg-turbo-devel zlib-devel i2c-tools i2c-tools-python
git clone https://github.com/RPi-Distro/RTIMULib
git clone https://github.com/RPi-Distro/python-sense-hat
(cd RPi-Distro/RTIMULib/Linux/python; python setup.py)
(cd python-sense-hat; python setup.py)
