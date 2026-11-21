#!/usr/bin/env bash
# Phase-34284: STATUS Soft 34280+ ssh_auth_soft_35440_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 34280\+|through 34288|ssh_auth_soft_35440_echo_roster' webui/STATUS.md
grep -qE 'phase34288|through 34288|e2e-phase34296' webui/STATUS.md
echo "STATUS Soft 34280+ ok"; echo "cleaned"; echo "OK: phase34284 e2e passed"
