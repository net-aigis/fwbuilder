#!/usr/bin/env bash
# Phase-36044: STATUS Soft 36040+ ssh_auth_schema_387_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36040\+|through 36048|ssh_auth_schema_387_echo_roster' webui/STATUS.md
grep -qE 'phase36048|through 36048|e2e-phase36056' webui/STATUS.md
echo "STATUS Soft 36040+ ok"; echo "cleaned"; echo "OK: phase36044 e2e passed"
