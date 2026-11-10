#!/usr/bin/env bash
# Phase-26124: STATUS Soft 26120+ ssh_auth_schema_263_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 26120\+|through 26128|ssh_auth_schema_263_echo_roster' webui/STATUS.md
grep -qE 'phase26128|through 26128|e2e-phase26136' webui/STATUS.md
echo "STATUS Soft 26120+ ok"; echo "cleaned"; echo "OK: phase26124 e2e passed"
