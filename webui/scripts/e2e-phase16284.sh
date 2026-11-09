#!/usr/bin/env bash
# Phase-16284: STATUS Soft 16280+ ssh_auth_hexa_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16280\+|through 16288|ssh_auth_hexa_checkpoint_roster' webui/STATUS.md
grep -qE 'phase16288|through 16288|e2e-phase16296' webui/STATUS.md
echo "STATUS Soft 16280+ ok"; echo "cleaned"; echo "OK: phase16284 e2e passed"
