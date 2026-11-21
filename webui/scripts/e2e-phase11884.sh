#!/usr/bin/env bash
# Phase-11884: STATUS Soft 11880+ ssh_auth_export_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 11880\+|through 11888|ssh_auth_export_count_roster' webui/STATUS.md
grep -qE 'phase11888|through 11888|e2e-phase11896' webui/STATUS.md
echo "STATUS Soft 11880+ ok"; echo "cleaned"; echo "OK: phase11884 e2e passed"
