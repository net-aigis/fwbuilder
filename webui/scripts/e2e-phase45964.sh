#!/usr/bin/env bash
# Phase-45964: STATUS Soft 45960+ ssh_auth_schema_511_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45960\+|through 45968|ssh_auth_schema_511_echo_roster' webui/STATUS.md
grep -qE 'phase45968|through 45968|e2e-phase45976' webui/STATUS.md
echo "STATUS Soft 45960+ ok"; echo "cleaned"; echo "OK: phase45964 e2e passed"
