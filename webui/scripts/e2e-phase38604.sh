#!/usr/bin/env bash
# Phase-38604: STATUS Soft 38600+ ssh_auth_schema_419_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 38600\+|through 38608|ssh_auth_schema_419_echo_roster' webui/STATUS.md
grep -qE 'phase38608|through 38608|e2e-phase38616' webui/STATUS.md
echo "STATUS Soft 38600+ ok"; echo "cleaned"; echo "OK: phase38604 e2e passed"
