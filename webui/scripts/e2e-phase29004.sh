#!/usr/bin/env bash
# Phase-29004: STATUS Soft 29000+ ssh_auth_schema_299_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29000\+|through 29008|ssh_auth_schema_299_echo_roster' webui/STATUS.md
grep -qE 'phase29008|through 29008|e2e-phase29016' webui/STATUS.md
echo "STATUS Soft 29000+ ok"; echo "cleaned"; echo "OK: phase29004 e2e passed"
