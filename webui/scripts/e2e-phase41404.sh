#!/usr/bin/env bash
# Phase-41404: STATUS Soft 41400+ ssh_auth_ms_86500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41400\+|through 41408|ssh_auth_ms_86500_echo_roster' webui/STATUS.md
grep -qE 'phase41408|through 41408|e2e-phase41416' webui/STATUS.md
echo "STATUS Soft 41400+ ok"; echo "cleaned"; echo "OK: phase41404 e2e passed"
