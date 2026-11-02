# nftables wiring for central hooks

Done on branch `feature/central-hooks-on-nft` (PR #6 tip + this feature).

`CompilerDriver_nft_run.cpp` calls `CentralHooks::composeOrAbort` for
`prolog_script` / `epilog_script` the same way as iptables. Platform
name `nftables` is already accepted by `CentralHooks`.

When merging into `main`:

1. Land PR #6 (or this combined branch).
2. Land `feature/central-prolog-epilog` if #6 was merged alone, then
   re-apply the nft compose call — or merge this branch instead and
   skip the separate cherry-pick.

Do not rework the native nftables routing compiler for this feature.
