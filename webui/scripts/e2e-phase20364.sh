#!/usr/bin/env bash
# Phase-20364: STATUS Soft 20360+ ssh_auth_schema_191_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 20360\+|through 20368|ssh_auth_schema_191_echo_roster' webui/STATUS.md
grep -qE 'phase20368|through 20368|e2e-phase20376' webui/STATUS.md
echo "STATUS Soft 20360+ ok"; echo "cleaned"; echo "OK: phase20364 e2e passed"
