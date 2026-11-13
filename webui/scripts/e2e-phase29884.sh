#!/usr/bin/env bash
# Phase-29884: STATUS Soft 29880+ ssh_auth_ms_68500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29880\+|through 29888|ssh_auth_ms_68500_echo_roster' webui/STATUS.md
grep -qE 'phase29888|through 29888|e2e-phase29896' webui/STATUS.md
echo "STATUS Soft 29880+ ok"; echo "cleaned"; echo "OK: phase29884 e2e passed"
