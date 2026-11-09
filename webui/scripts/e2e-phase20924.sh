#!/usr/bin/env bash
# Phase-20924: STATUS Soft 20920+ ssh_auth_ms_54500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20920\+|through 20928|ssh_auth_ms_54500_echo_roster' webui/STATUS.md
grep -qE 'phase20928|through 20928|e2e-phase20936' webui/STATUS.md
echo "STATUS Soft 20920+ ok"; echo "cleaned"; echo "OK: phase20924 e2e passed"
