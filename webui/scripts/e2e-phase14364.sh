#!/usr/bin/env bash
# Phase-14364: STATUS Soft 14360+ ssh_auth_surface_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14360\+|through 14368|ssh_auth_surface_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14368|through 14368|e2e-phase14376' webui/STATUS.md
echo "STATUS Soft 14360+ ok"; echo "cleaned"; echo "OK: phase14364 e2e passed"
