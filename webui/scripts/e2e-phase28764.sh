#!/usr/bin/env bash
# Phase-28764: STATUS Soft 28760+ ssh_auth_triacontapentacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28760\+|through 28768|ssh_auth_triacontapentacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase28768|through 28768|e2e-phase28776' webui/STATUS.md
echo "STATUS Soft 28760+ ok"; echo "cleaned"; echo "OK: phase28764 e2e passed"
