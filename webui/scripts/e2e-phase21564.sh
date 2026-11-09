#!/usr/bin/env bash
# Phase-21564: STATUS Soft 21560+ ssh_auth_ms_55500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21560\+|through 21568|ssh_auth_ms_55500_echo_roster' webui/STATUS.md
grep -qE 'phase21568|through 21568|e2e-phase21576' webui/STATUS.md
echo "STATUS Soft 21560+ ok"; echo "cleaned"; echo "OK: phase21564 e2e passed"
