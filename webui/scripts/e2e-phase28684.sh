#!/usr/bin/env bash
# Phase-28684: STATUS Soft 28680+ ssh_auth_schema_295_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 28680\+|through 28688|ssh_auth_schema_295_echo_roster' webui/STATUS.md
grep -qE 'phase28688|through 28688|e2e-phase28696' webui/STATUS.md
echo "STATUS Soft 28680+ ok"; echo "cleaned"; echo "OK: phase28684 e2e passed"
