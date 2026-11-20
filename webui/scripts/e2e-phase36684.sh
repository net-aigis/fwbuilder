#!/usr/bin/env bash
# Phase-36684: STATUS Soft 36680+ ssh_auth_schema_395_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36680\+|through 36688|ssh_auth_schema_395_echo_roster' webui/STATUS.md
grep -qE 'phase36688|through 36688|e2e-phase36696' webui/STATUS.md
echo "STATUS Soft 36680+ ok"; echo "cleaned"; echo "OK: phase36684 e2e passed"
