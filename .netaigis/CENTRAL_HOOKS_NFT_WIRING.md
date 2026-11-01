# nftables wiring for central hooks

`CentralHooks` already treats platform `nftables` as a shell-hook
backend. Branch `feature/central-hooks-on-nft` (based on PR #6) applies
the compose call in `CompilerDriver_nft_run.cpp` and extends
`ci/check-central-hooks.sh` for `fwb_nft`.

Prefer merging that combined branch after PR #6, or cherry-pick its
nft wiring commit onto `modernization/start` once #6 and this hooks
branch have both landed.

Do not rework the native nftables routing compiler for this feature.
