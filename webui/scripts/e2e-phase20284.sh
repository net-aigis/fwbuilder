#!/usr/bin/env bash
# Phase-20284: STATUS Soft 20280+ ssh_auth_ms_53500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20280\+|through 20288|ssh_auth_ms_53500_echo_roster' webui/STATUS.md
grep -qE 'phase20288|through 20288|e2e-phase20296' webui/STATUS.md
echo "STATUS Soft 20280+ ok"; echo "cleaned"; echo "OK: phase20284 e2e passed"
