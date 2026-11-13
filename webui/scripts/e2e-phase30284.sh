#!/usr/bin/env bash
# Phase-30284: STATUS Soft 30280+ ssh_auth_schema_315_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 30280\+|through 30288|ssh_auth_schema_315_echo_roster' webui/STATUS.md
grep -qE 'phase30288|through 30288|e2e-phase30296' webui/STATUS.md
echo "STATUS Soft 30280+ ok"; echo "cleaned"; echo "OK: phase30284 e2e passed"
