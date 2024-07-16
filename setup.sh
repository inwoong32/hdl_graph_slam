#!/bin/bash

git clone https://github.com/koide3/ndt_omp.git $(dirname $0)/hdl_graph_slam/src/ndt_omp
git clone https://github.com/SMRT-AIST/fast_gicp.git --recursive $(dirname $0)/hdl_graph_slam/src/fast_gicp
