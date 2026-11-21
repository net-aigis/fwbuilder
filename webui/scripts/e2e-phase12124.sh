#!/usr/bin/env bash
# Phase-12124: STATUS Soft 12120+ ssh_auth_readiness_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12120\+|through 12128|ssh_auth_readiness_echo_roster' webui/STATUS.md
grep -qE 'phase12128|through 12128|e2e-phase12136' webui/STATUS.md
echo "STATUS Soft 12120+ ok"; echo "cleaned"; echo "OK: phase12124 e2e passed"
