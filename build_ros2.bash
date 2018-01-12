#!/bin/bash

set -euf -o pipefail

PYTHON_MAJOR=3
PYTHON_MINOR=5

#export POCO_ROOT="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib"

src/ament/ament_tools/scripts/ament.py build \
    --isolated \
    --cmake-args \
    -DCMAKE_FIND_ROOT_PATH="/ros2_ws/install_isolated" \
    -DCMAKE_TOOLCHAIN_FILE="/polly/raspberrypi3-cxx11.cmake" \
    -DPYTHON_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include/python${PYTHON_MAJOR}.${PYTHON_MINOR}m" \
    -DPYTHON_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libpython${PYTHON_MAJOR}.${PYTHON_MINOR}m.so" \
    -DPYTHON_SOABI="cpython-${PYTHON_MAJOR}${PYTHON_MINOR}m-${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}" \
    -DEIGEN3_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include/eigen3" \
    -DOpenCV_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/share/OpenCV" \
    -DEigen3_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib/cmake/eigen3" \
    -DPoco_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include" \
    -DPoco_LIBRARY_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib" \
    -DASIO_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include" \
    -DTINYXML2_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include" \
    -DTINYXML2_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libtinyxml2.so" \
    -DTinyXML_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include" \
    -DTinyXML_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libtinyxml.so" \
    -DCURL_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}" \
    -DCURL_LIBRARY="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib/${RASPBERRYPI_CROSS_COMPILE_TOOLCHAIN_PREFIX}/libcurl.so" \
    -DPoco_LIBRARY_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/lib" \
    -DPoco_INCLUDE_DIR="${RASPBERRYPI_CROSS_COMPILE_SYSROOT}/usr/include" \
    -DPoco_LIBRARIES="dl;PocoFoundation" \
    -- \
    --skip-packages \
        robot_state_publisher \
        rviz_common \
        rviz_default_plugins \
        rviz_ogre_vendor \
        rviz_rendering \
        rviz_rendering_tests \
        rviz2 \
    --parallel $*
