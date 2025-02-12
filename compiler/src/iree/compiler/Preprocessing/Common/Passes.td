// Copyright 2023 The IREE Authors
//
// Licensed under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception

#ifndef IREE_PREPROCESSING_COMMON_PASSES
#define IREE_PREPROCESSING_COMMON_PASSES

include "mlir/Pass/PassBase.td"

def ConvertConv2DToImg2Col :
    Pass<"iree-preprocessing-convert-conv2d-to-img2col", ""> {
  let summary = "Convert linalg convolution ops to matmul img2col based implementation";
  let constructor = "mlir::iree_compiler::IREE::createConvertConv2DToImg2ColPass()";
}

def ConvertConvNchwToNhwc :
    InterfacePass<"iree-flow-convert-conv-nchw-to-nhwc", "mlir::FunctionOpInterface"> {
  let summary = "Convert linalg NCHW Convolutions to NHWC";
  let constructor =
      "mlir::iree_compiler::IREE::createConvertConvNchwToNhwcPass()";
}

def GeneralizeAndFuse :
    Pass<"iree-flow-generalize-and-fuse", ""> {
  let summary = "Generalizes named op and try to fuse them.";
  let constructor = "mlir::iree_compiler::IREE::createGeneralizeAndFusePass()";
}

def ConvertLinalgMatmulToMmt :
    Pass<"iree-flow-convert-linalg-matmul-to-mmt", ""> {
  let summary = "Convert linalg.matmul to linalg.transpose + linalg.matmul";
  let constructor = "mlir::iree_compiler::IREE::createConvertLinalgMatmulToMmtPass()";
}

def GeneralizeConvolutions :
    Pass<"iree-preprocessing-generalize-convolutions", ""> {
  let summary = "Generalize all convolution ops";
  let constructor = "mlir::iree_compiler::IREE::createGeneralizeConvolutionsPass()";
}

def ConvertConvToChannelsLast :
    Pass<"iree-preprocessing-convert-conv-to-channels-last", ""> {
  let summary = "Convert linalg convolutions to channels last.";
  let constructor =
      "mlir::iree_compiler::IREE::createConvertConvToChannelsLastPass()";
  let options = [
    Option<"tileSize", "tile-size", "int",
           /*default=*/"0",
           "Specify the tiling factor">,
  ];
}

def PadLinalgOps :
    Pass<"iree-preprocessing-pad-linalg-ops", ""> {
  let summary = "Pad linalg ops to the next integer multiple of paddingSize.";
  let constructor = "mlir::iree_compiler::IREE::createPadLinalgOpsToIntegerMultiplePass()";
  let options = [
    Option<"paddingSize", "pad-size", "int",
           /*default=*/"4",
           "Specify the padding size">,
  ];
}

#endif  // IREE_PREPROCESSING_COMMON_PASSES
