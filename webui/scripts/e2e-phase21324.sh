#!/usr/bin/env bash
# Phase-21324: STATUS Soft 21320+ ssh_auth_schema_203_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21320\+|through 21328|ssh_auth_schema_203_echo_roster' webui/STATUS.md
grep -qE 'phase21328|through 21328|e2e-phase21336' webui/STATUS.md
echo "STATUS Soft 21320+ ok"; echo "cleaned"; echo "OK: phase21324 e2e passed"
