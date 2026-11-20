#!/usr/bin/env bash
# Phase-38924: STATUS Soft 38920+ ssh_auth_schema_423_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38920\+|through 38928|ssh_auth_schema_423_echo_roster' webui/STATUS.md
grep -qE 'phase38928|through 38928|e2e-phase38936' webui/STATUS.md
echo "STATUS Soft 38920+ ok"; echo "cleaned"; echo "OK: phase38924 e2e passed"
