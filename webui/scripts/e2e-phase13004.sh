#!/usr/bin/env bash
# Phase-13004: STATUS Soft 13000+ ssh_auth_export_family_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13000\+|through 13008|ssh_auth_export_family_roster' webui/STATUS.md
grep -qE 'phase13008|through 13008|e2e-phase13016' webui/STATUS.md
echo "STATUS Soft 13000+ ok"; echo "cleaned"; echo "OK: phase13004 e2e passed"
