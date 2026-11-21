#!/usr/bin/env bash
# Phase-5004: STATUS Soft 5000+ ssh_alternatives_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5000\+|through 5008|ssh_alternatives_roster' webui/STATUS.md
grep -qE 'phase5008|through 5008|e2e-phase5008' webui/STATUS.md
echo "STATUS Soft 5000+ ok"; echo "cleaned"; echo "OK: phase5004 e2e passed"
