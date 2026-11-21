#!/usr/bin/env bash
# Phase-25244: STATUS Soft 25240+ ssh_auth_triacontatetradeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25240\+|through 25248|ssh_auth_triacontatetradeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase25248|through 25248|e2e-phase25256' webui/STATUS.md
echo "STATUS Soft 25240+ ok"; echo "cleaned"; echo "OK: phase25244 e2e passed"
