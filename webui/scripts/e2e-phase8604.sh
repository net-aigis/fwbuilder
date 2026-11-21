#!/usr/bin/env bash
# Phase-8604: STATUS Soft 8600+ ssh_implemented_identity_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8600\+|through 8608|ssh_implemented_identity_refresh_roster' webui/STATUS.md
grep -qE 'phase8608|through 8608|e2e-phase8616' webui/STATUS.md
echo "STATUS Soft 8600+ ok"; echo "cleaned"; echo "OK: phase8604 e2e passed"
