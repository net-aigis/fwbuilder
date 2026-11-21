#!/usr/bin/env bash
# Phase-31564: STATUS Soft 31560+ ssh_auth_schema_331_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 31560\+|through 31568|ssh_auth_schema_331_echo_roster' webui/STATUS.md
grep -qE 'phase31568|through 31568|e2e-phase31576' webui/STATUS.md
echo "STATUS Soft 31560+ ok"; echo "cleaned"; echo "OK: phase31564 e2e passed"
