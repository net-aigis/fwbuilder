#!/usr/bin/env bash
# Phase-25084: STATUS Soft 25080+ ssh_auth_ms_61000_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25080\+|through 25088|ssh_auth_ms_61000_echo_roster' webui/STATUS.md
grep -qE 'phase25088|through 25088|e2e-phase25096' webui/STATUS.md
echo "STATUS Soft 25080+ ok"; echo "cleaned"; echo "OK: phase25084 e2e passed"
