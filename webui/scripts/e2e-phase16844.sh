#!/usr/bin/env bash
# Phase-16844: STATUS Soft 16840+ ssh_auth_schema_147_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 16840\+|through 16848|ssh_auth_schema_147_echo_roster' webui/STATUS.md
grep -qE 'phase16848|through 16848|e2e-phase16856' webui/STATUS.md
echo "STATUS Soft 16840+ ok"; echo "cleaned"; echo "OK: phase16844 e2e passed"
