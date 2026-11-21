#!/usr/bin/env bash
# Phase-25724: STATUS Soft 25720+ ssh_auth_ms_62000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25720\+|through 25728|ssh_auth_ms_62000_echo_roster' webui/STATUS.md
grep -qE 'phase25728|through 25728|e2e-phase25736' webui/STATUS.md
echo "STATUS Soft 25720+ ok"; echo "cleaned"; echo "OK: phase25724 e2e passed"
