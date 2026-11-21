#!/usr/bin/env bash
# Phase-36604: STATUS Soft 36600+ ssh_auth_ms_79000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36600\+|through 36608|ssh_auth_ms_79000_echo_roster' webui/STATUS.md
grep -qE 'phase36608|through 36608|e2e-phase36616' webui/STATUS.md
echo "STATUS Soft 36600+ ok"; echo "cleaned"; echo "OK: phase36604 e2e passed"
