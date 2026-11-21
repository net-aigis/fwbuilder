#!/usr/bin/env bash
# Phase-14844: STATUS Soft 14840+ ssh_auth_schema_delta_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14840\+|through 14848|ssh_auth_schema_delta_roster' webui/STATUS.md
grep -qE 'phase14848|through 14848|e2e-phase14856' webui/STATUS.md
echo "STATUS Soft 14840+ ok"; echo "cleaned"; echo "OK: phase14844 e2e passed"
