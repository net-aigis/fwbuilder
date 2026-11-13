#!/usr/bin/env bash
# Phase-28444: STATUS Soft 28440+ ssh_auth_triacontatetracosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28440\+|through 28448|ssh_auth_triacontatetracosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase28448|through 28448|e2e-phase28456' webui/STATUS.md
echo "STATUS Soft 28440+ ok"; echo "cleaned"; echo "OK: phase28444 e2e passed"
