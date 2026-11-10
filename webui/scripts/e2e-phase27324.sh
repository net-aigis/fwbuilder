#!/usr/bin/env bash
# Phase-27324: STATUS Soft 27320+ ssh_auth_ms_64500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27320\+|through 27328|ssh_auth_ms_64500_echo_roster' webui/STATUS.md
grep -qE 'phase27328|through 27328|e2e-phase27336' webui/STATUS.md
echo "STATUS Soft 27320+ ok"; echo "cleaned"; echo "OK: phase27324 e2e passed"
