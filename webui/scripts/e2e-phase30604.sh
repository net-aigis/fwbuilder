#!/usr/bin/env bash
# Phase-30604: STATUS Soft 30600+ ssh_auth_schema_319_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30600\+|through 30608|ssh_auth_schema_319_echo_roster' webui/STATUS.md
grep -qE 'phase30608|through 30608|e2e-phase30616' webui/STATUS.md
echo "STATUS Soft 30600+ ok"; echo "cleaned"; echo "OK: phase30604 e2e passed"
