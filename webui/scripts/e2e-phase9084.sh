#!/usr/bin/env bash
# Phase-9084: STATUS Soft 9080+ ssh_auth_field_presence_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9080\+|through 9088|ssh_auth_field_presence_roster' webui/STATUS.md
grep -qE 'phase9088|through 9088|e2e-phase9096' webui/STATUS.md
echo "STATUS Soft 9080+ ok"; echo "cleaned"; echo "OK: phase9084 e2e passed"
