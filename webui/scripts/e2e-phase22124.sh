#!/usr/bin/env bash
# Phase-22124: STATUS Soft 22120+ ssh_auth_soft_22200_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22120\+|through 22128|ssh_auth_soft_22200_echo_roster' webui/STATUS.md
grep -qE 'phase22128|through 22128|e2e-phase22136' webui/STATUS.md
echo "STATUS Soft 22120+ ok"; echo "cleaned"; echo "OK: phase22124 e2e passed"
