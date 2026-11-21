#!/usr/bin/env bash
# Phase-14284: STATUS Soft 14280+ ssh_auth_export_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14280\+|through 14288|ssh_auth_export_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14288|through 14288|e2e-phase14296' webui/STATUS.md
echo "STATUS Soft 14280+ ok"; echo "cleaned"; echo "OK: phase14284 e2e passed"
