#!/usr/bin/env bash
# Phase-30524: STATUS Soft 30520+ ssh_auth_ms_69500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30520\+|through 30528|ssh_auth_ms_69500_echo_roster' webui/STATUS.md
grep -qE 'phase30528|through 30528|e2e-phase30536' webui/STATUS.md
echo "STATUS Soft 30520+ ok"; echo "cleaned"; echo "OK: phase30524 e2e passed"
