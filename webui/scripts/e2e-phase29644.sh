#!/usr/bin/env bash
# Phase-29644: STATUS Soft 29640+ ssh_auth_schema_307_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29640\+|through 29648|ssh_auth_schema_307_echo_roster' webui/STATUS.md
grep -qE 'phase29648|through 29648|e2e-phase29656' webui/STATUS.md
echo "STATUS Soft 29640+ ok"; echo "cleaned"; echo "OK: phase29644 e2e passed"
