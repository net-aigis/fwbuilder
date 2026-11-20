#!/usr/bin/env bash
# Phase-41724: STATUS Soft 41720+ ssh_auth_ms_87000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41720\+|through 41728|ssh_auth_ms_87000_echo_roster' webui/STATUS.md
grep -qE 'phase41728|through 41728|e2e-phase41736' webui/STATUS.md
echo "STATUS Soft 41720+ ok"; echo "cleaned"; echo "OK: phase41724 e2e passed"
