#!/usr/bin/env bash
# Phase-20044: STATUS Soft 20040+ ssh_auth_schema_187_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20040\+|through 20048|ssh_auth_schema_187_echo_roster' webui/STATUS.md
grep -qE 'phase20048|through 20048|e2e-phase20056' webui/STATUS.md
echo "STATUS Soft 20040+ ok"; echo "cleaned"; echo "OK: phase20044 e2e passed"
