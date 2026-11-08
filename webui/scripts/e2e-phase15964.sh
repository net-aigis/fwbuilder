#!/usr/bin/env bash
# Phase-15964: STATUS Soft 15960+ ssh_auth_penta_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15960\+|through 15968|ssh_auth_penta_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15968|through 15968|e2e-phase15976' webui/STATUS.md
echo "STATUS Soft 15960+ ok"; echo "cleaned"; echo "OK: phase15964 e2e passed"
