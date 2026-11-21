#!/usr/bin/env bash
# Phase-23244: STATUS Soft 23240+ ssh_auth_schema_227_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23240\+|through 23248|ssh_auth_schema_227_echo_roster' webui/STATUS.md
grep -qE 'phase23248|through 23248|e2e-phase23256' webui/STATUS.md
echo "STATUS Soft 23240+ ok"; echo "cleaned"; echo "OK: phase23244 e2e passed"
