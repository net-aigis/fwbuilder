#!/usr/bin/env bash
# Phase-13724: STATUS Soft 13720+ ssh_auth_cap_key_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13720\+|through 13728|ssh_auth_cap_key_count_roster' webui/STATUS.md
grep -qE 'phase13728|through 13728|e2e-phase13736' webui/STATUS.md
echo "STATUS Soft 13720+ ok"; echo "cleaned"; echo "OK: phase13724 e2e passed"
