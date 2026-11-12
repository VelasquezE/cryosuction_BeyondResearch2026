cmake_minimum_required(VERSION 3.13.4)

set(CMAKE_PREFIX_PATH "/home/berylla/dealii-install")

find_package(deal.II 9.7.1 REQUIRED)

deal_ii_initialize_cached_variables()

project(cryosuction)

add_executable(cryosuction cryosuction.cpp)
deal_ii_setup_target(cryosuction)

