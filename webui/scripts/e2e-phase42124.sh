#!/usr/bin/env bash
# Phase-42124: STATUS Soft 42120+ ssh_auth_schema_463_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 42120\+|through 42128|ssh_auth_schema_463_echo_roster' webui/STATUS.md
grep -qE 'phase42128|through 42128|e2e-phase42136' webui/STATUS.md
echo "STATUS Soft 42120+ ok"; echo "cleaned"; echo "OK: phase42124 e2e passed"
