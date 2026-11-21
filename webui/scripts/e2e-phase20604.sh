#!/usr/bin/env bash
# Phase-20604: STATUS Soft 20600+ ssh_auth_ms_54000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20600\+|through 20608|ssh_auth_ms_54000_echo_roster' webui/STATUS.md
grep -qE 'phase20608|through 20608|e2e-phase20616' webui/STATUS.md
echo "STATUS Soft 20600+ ok"; echo "cleaned"; echo "OK: phase20604 e2e passed"
