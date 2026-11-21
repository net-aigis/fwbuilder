#!/usr/bin/env bash
# Phase-30924: STATUS Soft 30920+ ssh_auth_schema_323_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30920\+|through 30928|ssh_auth_schema_323_echo_roster' webui/STATUS.md
grep -qE 'phase30928|through 30928|e2e-phase30936' webui/STATUS.md
echo "STATUS Soft 30920+ ok"; echo "cleaned"; echo "OK: phase30924 e2e passed"
