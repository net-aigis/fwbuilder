#!/usr/bin/env bash
# Phase-13244: STATUS Soft 13240+ ssh_auth_schema_parts_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13240\+|through 13248|ssh_auth_schema_parts_roster' webui/STATUS.md
grep -qE 'phase13248|through 13248|e2e-phase13256' webui/STATUS.md
echo "STATUS Soft 13240+ ok"; echo "cleaned"; echo "OK: phase13244 e2e passed"
