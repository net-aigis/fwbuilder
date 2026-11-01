# nftables wiring for central hooks

`CentralHooks` already treats platform `nftables` as a shell-hook
backend. PR #6 (`feature/native-nftables-port`) sets `prolog_script` /
`epilog_script` in `CompilerDriver_nft_run.cpp` the same way iptables
does.

When integrating that branch into `modernization/start`, apply the same
compose call used in `CompilerDriver_ipt_run.cpp`:

```cpp
#include "CentralHooks.h"
// ...
QString prolog_merged = CentralHooks::composeOrAbort(
    CentralHooks::Prolog, fw, platform,
    fw->getOptionsObject()->getStr("prolog_script"), &hooks_error);
```

Do not rework the native nftables routing compiler for this feature.
