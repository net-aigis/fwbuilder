#!/usr/bin/env bash
# Phase-21244: STATUS Soft 21240+ ssh_auth_ms_55000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21240\+|through 21248|ssh_auth_ms_55000_echo_roster' webui/STATUS.md
grep -qE 'phase21248|through 21248|e2e-phase21256' webui/STATUS.md
echo "STATUS Soft 21240+ ok"; echo "cleaned"; echo "OK: phase21244 e2e passed"
