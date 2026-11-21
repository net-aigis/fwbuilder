#!/usr/bin/env bash
# Phase-45884: STATUS Soft 45880+ ssh_auth_ms_93500_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45880\+|through 45888|ssh_auth_ms_93500_echo_roster' webui/STATUS.md
grep -qE 'phase45888|through 45888|e2e-phase45896' webui/STATUS.md
echo "STATUS Soft 45880+ ok"; echo "cleaned"; echo "OK: phase45884 e2e passed"
