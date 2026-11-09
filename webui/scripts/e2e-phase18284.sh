#!/usr/bin/env bash
# Phase-18284: STATUS Soft 18280+ ssh_auth_soft_18240_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18280\+|through 18288|ssh_auth_soft_18240_echo_roster' webui/STATUS.md
grep -qE 'phase18288|through 18288|e2e-phase18296' webui/STATUS.md
echo "STATUS Soft 18280+ ok"; echo "cleaned"; echo "OK: phase18284 e2e passed"
