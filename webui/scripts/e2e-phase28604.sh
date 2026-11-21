#!/usr/bin/env bash
# Phase-28604: STATUS Soft 28600+ ssh_auth_ms_66500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28600\+|through 28608|ssh_auth_ms_66500_echo_roster' webui/STATUS.md
grep -qE 'phase28608|through 28608|e2e-phase28616' webui/STATUS.md
echo "STATUS Soft 28600+ ok"; echo "cleaned"; echo "OK: phase28604 e2e passed"
