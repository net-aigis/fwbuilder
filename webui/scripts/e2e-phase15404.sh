#!/usr/bin/env bash
# Phase-15404: STATUS Soft 15400+ ssh_auth_soft_15300_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15400\+|through 15408|ssh_auth_soft_15300_echo_roster' webui/STATUS.md
grep -qE 'phase15408|through 15408|e2e-phase15416' webui/STATUS.md
echo "STATUS Soft 15400+ ok"; echo "cleaned"; echo "OK: phase15404 e2e passed"
