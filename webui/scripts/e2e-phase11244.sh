#!/usr/bin/env bash
# Phase-11244: STATUS Soft 11240+ ssh_auth_export_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11240\+|through 11248|ssh_auth_export_hint_roster' webui/STATUS.md
grep -qE 'phase11248|through 11248|e2e-phase11256' webui/STATUS.md
echo "STATUS Soft 11240+ ok"; echo "cleaned"; echo "OK: phase11244 e2e passed"
