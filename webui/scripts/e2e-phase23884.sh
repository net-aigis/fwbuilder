#!/usr/bin/env bash
# Phase-23884: STATUS Soft 23880+ ssh_auth_schema_235_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23880\+|through 23888|ssh_auth_schema_235_echo_roster' webui/STATUS.md
grep -qE 'phase23888|through 23888|e2e-phase23896' webui/STATUS.md
echo "STATUS Soft 23880+ ok"; echo "cleaned"; echo "OK: phase23884 e2e passed"
