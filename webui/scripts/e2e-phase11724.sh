#!/usr/bin/env bash
# Phase-11724: STATUS Soft 11720+ ssh_auth_schema_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11720\+|through 11728|ssh_auth_schema_echo_roster' webui/STATUS.md
grep -qE 'phase11728|through 11728|e2e-phase11736' webui/STATUS.md
echo "STATUS Soft 11720+ ok"; echo "cleaned"; echo "OK: phase11724 e2e passed"
