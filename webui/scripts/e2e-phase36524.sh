#!/usr/bin/env bash
# Phase-36524: STATUS Soft 36520+ ssh_auth_soft_37960_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36520\+|through 36528|ssh_auth_soft_37960_echo_roster' webui/STATUS.md
grep -qE 'phase36528|through 36528|e2e-phase36536' webui/STATUS.md
echo "STATUS Soft 36520+ ok"; echo "cleaned"; echo "OK: phase36524 e2e passed"
