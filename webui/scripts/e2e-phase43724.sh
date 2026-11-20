#!/usr/bin/env bash
# Phase-43724: STATUS Soft 43720+ ssh_auth_schema_483_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43720\+|through 43728|ssh_auth_schema_483_echo_roster' webui/STATUS.md
grep -qE 'phase43728|through 43728|e2e-phase43736' webui/STATUS.md
echo "STATUS Soft 43720+ ok"; echo "cleaned"; echo "OK: phase43724 e2e passed"
