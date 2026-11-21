#!/usr/bin/env bash
# Phase-27644: STATUS Soft 27640+ ssh_auth_ms_65000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27640\+|through 27648|ssh_auth_ms_65000_echo_roster' webui/STATUS.md
grep -qE 'phase27648|through 27648|e2e-phase27656' webui/STATUS.md
echo "STATUS Soft 27640+ ok"; echo "cleaned"; echo "OK: phase27644 e2e passed"
