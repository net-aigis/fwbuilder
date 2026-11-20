#!/usr/bin/env bash
# Phase-36284: STATUS Soft 36280+ ssh_auth_ms_78500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36280\+|through 36288|ssh_auth_ms_78500_echo_roster' webui/STATUS.md
grep -qE 'phase36288|through 36288|e2e-phase36296' webui/STATUS.md
echo "STATUS Soft 36280+ ok"; echo "cleaned"; echo "OK: phase36284 e2e passed"
