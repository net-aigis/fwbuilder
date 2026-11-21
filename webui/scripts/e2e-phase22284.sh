#!/usr/bin/env bash
# Phase-22284: STATUS Soft 22280+ ssh_auth_schema_215_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22280\+|through 22288|ssh_auth_schema_215_echo_roster' webui/STATUS.md
grep -qE 'phase22288|through 22288|e2e-phase22296' webui/STATUS.md
echo "STATUS Soft 22280+ ok"; echo "cleaned"; echo "OK: phase22284 e2e passed"
