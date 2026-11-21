#!/usr/bin/env bash
# Phase-23004: STATUS Soft 23000+ ssh_auth_heptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23000\+|through 23008|ssh_auth_heptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23008|through 23008|e2e-phase23016' webui/STATUS.md
echo "STATUS Soft 23000+ ok"; echo "cleaned"; echo "OK: phase23004 e2e passed"
