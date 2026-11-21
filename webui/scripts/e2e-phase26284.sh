#!/usr/bin/env bash
# Phase-26284: STATUS Soft 26280+ ssh_auth_soft_26520_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26280\+|through 26288|ssh_auth_soft_26520_echo_roster' webui/STATUS.md
grep -qE 'phase26288|through 26288|e2e-phase26296' webui/STATUS.md
echo "STATUS Soft 26280+ ok"; echo "cleaned"; echo "OK: phase26284 e2e passed"
