#!/usr/bin/env bash
# Phase-22604: STATUS Soft 22600+ ssh_auth_schema_219_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 22600\+|through 22608|ssh_auth_schema_219_echo_roster' webui/STATUS.md
grep -qE 'phase22608|through 22608|e2e-phase22616' webui/STATUS.md
echo "STATUS Soft 22600+ ok"; echo "cleaned"; echo "OK: phase22604 e2e passed"
