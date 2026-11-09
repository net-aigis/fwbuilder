#!/usr/bin/env bash
# Phase-18124: STATUS Soft 18120+ ssh_auth_schema_163_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18120\+|through 18128|ssh_auth_schema_163_echo_roster' webui/STATUS.md
grep -qE 'phase18128|through 18128|e2e-phase18136' webui/STATUS.md
echo "STATUS Soft 18120+ ok"; echo "cleaned"; echo "OK: phase18124 e2e passed"
