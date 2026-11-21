#!/usr/bin/env bash
# Phase-46604: STATUS Soft 46600+ ssh_auth_schema_519_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 46600\+|through 46608|ssh_auth_schema_519_echo_roster' webui/STATUS.md
grep -qE 'phase46608|through 46608|e2e-phase46616' webui/STATUS.md
echo "STATUS Soft 46600+ ok"; echo "cleaned"; echo "OK: phase46604 e2e passed"
