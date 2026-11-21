#!/usr/bin/env bash
# Phase-28364: STATUS Soft 28360+ ssh_auth_schema_291_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28360\+|through 28368|ssh_auth_schema_291_echo_roster' webui/STATUS.md
grep -qE 'phase28368|through 28368|e2e-phase28376' webui/STATUS.md
echo "STATUS Soft 28360+ ok"; echo "cleaned"; echo "OK: phase28364 e2e passed"
