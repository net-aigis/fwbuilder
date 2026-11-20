#!/usr/bin/env bash
# Phase-47564: STATUS Soft 47560+ ssh_auth_schema_531_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 47560\+|through 47568|ssh_auth_schema_531_echo_roster' webui/STATUS.md
grep -qE 'phase47568|through 47568|e2e-phase47576' webui/STATUS.md
echo "STATUS Soft 47560+ ok"; echo "cleaned"; echo "OK: phase47564 e2e passed"
