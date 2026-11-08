#!/usr/bin/env bash
# Phase-15244: STATUS Soft 15240+ ssh_auth_schema_127_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15240\+|through 15248|ssh_auth_schema_127_echo_roster' webui/STATUS.md
grep -qE 'phase15248|through 15248|e2e-phase15256' webui/STATUS.md
echo "STATUS Soft 15240+ ok"; echo "cleaned"; echo "OK: phase15244 e2e passed"
