# Copyright 2023 The IREE Authors
#
# Licensed under the Apache License v2.0 with LLVM Exceptions.
# See https://llvm.org/LICENSE.txt for license information.
# SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

iree_hal_cts_test_suite(
  DRIVER_NAME
    metal
  DRIVER_REGISTRATION_HDR
    "experimental/metal/registration/driver_module.h"
  DRIVER_REGISTRATION_FN
    "iree_hal_metal_driver_module_register"
  COMPILER_TARGET_BACKEND
    "metal-spirv"
  EXECUTABLE_FORMAT
    "\"MTLE\""
  DEPS
    iree::experimental::metal::registration
  EXCLUDED_TESTS
    # HAL event is unimplemented for Metal right now.
    "event"
  LABELS
    driver=metal
)
