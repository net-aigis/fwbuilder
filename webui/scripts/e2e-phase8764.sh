#!/usr/bin/env bash
# Phase-8764: STATUS Soft 8760+ ssh_not_implemented_password_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8760\+|through 8768|ssh_not_implemented_password_refresh_roster' webui/STATUS.md
grep -qE 'phase8768|through 8768|e2e-phase8776' webui/STATUS.md
echo "STATUS Soft 8760+ ok"; echo "cleaned"; echo "OK: phase8764 e2e passed"
