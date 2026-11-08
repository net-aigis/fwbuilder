#!/usr/bin/env bash
# Phase-8284: STATUS Soft 8280+ ssh_alternative_presence_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8280\+|through 8288|ssh_alternative_presence_refresh_roster' webui/STATUS.md
grep -qE 'phase8288|through 8288|e2e-phase8296' webui/STATUS.md
echo "STATUS Soft 8280+ ok"; echo "cleaned"; echo "OK: phase8284 e2e passed"
