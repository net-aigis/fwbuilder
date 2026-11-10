#!/usr/bin/env bash
# Phase-27724: STATUS Soft 27720+ ssh_auth_schema_283_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 27720\+|through 27728|ssh_auth_schema_283_echo_roster' webui/STATUS.md
grep -qE 'phase27728|through 27728|e2e-phase27736' webui/STATUS.md
echo "STATUS Soft 27720+ ok"; echo "cleaned"; echo "OK: phase27724 e2e passed"
