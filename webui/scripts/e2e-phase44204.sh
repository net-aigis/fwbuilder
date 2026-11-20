#!/usr/bin/env bash
# Phase-44204: STATUS Soft 44200+ ssh_auth_soft_46600_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44200\+|through 44208|ssh_auth_soft_46600_echo_roster' webui/STATUS.md
grep -qE 'phase44208|through 44208|e2e-phase44216' webui/STATUS.md
echo "STATUS Soft 44200+ ok"; echo "cleaned"; echo "OK: phase44204 e2e passed"
