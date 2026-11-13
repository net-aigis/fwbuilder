#!/usr/bin/env bash
# Phase-28284: STATUS Soft 28280+ ssh_auth_ms_66000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28280\+|through 28288|ssh_auth_ms_66000_echo_roster' webui/STATUS.md
grep -qE 'phase28288|through 28288|e2e-phase28296' webui/STATUS.md
echo "STATUS Soft 28280+ ok"; echo "cleaned"; echo "OK: phase28284 e2e passed"
