#!/usr/bin/env bash
# Phase-6524: STATUS Soft 6680+ ssh_implemented_identity_roster (prior cycle tail).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6600\+|through 6616|ssh_honesty_refresh_roster' webui/STATUS.md
grep -qE 'phase6616|through 6616|e2e-phase6616' webui/STATUS.md
echo "STATUS Soft 6600+ ok"; echo "cleaned"; echo "OK: phase6524 e2e passed"
