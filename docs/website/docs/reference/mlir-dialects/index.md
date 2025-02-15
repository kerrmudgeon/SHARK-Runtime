# MLIR dialects

These pages contain automatically generated documentation for the MLIR dialects
defined in the IREE repository. IREE also makes extensive use of dialects from
the upstream MLIR repository, which are documented at
[https://mlir.llvm.org/docs/Dialects/](https://mlir.llvm.org/docs/Dialects/).

## IREE internal dialects

These dialects are an implementation detail of the IREE compiler, though they
can be used by plugins and other advanced integrations. The sources for most of
these dialects can be found in the
[`iree/compiler/Dialect/` directory](https://github.com/openxla/iree/tree/main/compiler/src/iree/compiler/Dialect).

Dialect                     | Description
--------------------------- | -----------
[Check](./Check.md)         | Defines assertions for IREE tests
[Flow](./Flow.md)           | Models execution data flow and partitioning
[HAL](./HAL.md)             | Represents operations against the IREE HAL[^1]
[HALInline](./HALInline.md) | Inline HAL interop runtime module dialect
[HALLoader](./HALLoader.md) | HAL inline executable loader runtime module dialect
[Stream](./Stream.md)       | Model execution partitioning and scheduling
[Util](./Util.md)           | Types and ops common across IREE subdialects
[VM](./VM.md)               | Represents operations against an abstract virtual machine
[VMVX](./VMVX.md)           | Virtual Machine Vector Extensions

## IREE public dialects

The ops in these dialects are legal to include in compiler inputs. The sources
for these dialects can be found in the
[`llvm-external-projects/iree-dialects/` directory](https://github.com/openxla/iree/tree/main/llvm-external-projects/iree-dialects)
that is designed to be used from other projects via LLVM's external projects
mechanism.

Dialect                             | Description
------------------------------------| -----------
[IREEInput](./IREEInput.md)         | Structural ops legal as input to IREE's compiler
[IREELinalgExt](./IREELinalgExt.md) | Extensions to the Linalg dialect for specific operations

[^1]: Hardware Abstraction Layer
