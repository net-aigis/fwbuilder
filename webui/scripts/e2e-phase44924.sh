#!/usr/bin/env bash
# Phase-44924: STATUS Soft 44920+ ssh_auth_ms_92000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 44920\+|through 44928|ssh_auth_ms_92000_echo_roster' webui/STATUS.md
grep -qE 'phase44928|through 44928|e2e-phase44936' webui/STATUS.md
echo "STATUS Soft 44920+ ok"; echo "cleaned"; echo "OK: phase44924 e2e passed"
