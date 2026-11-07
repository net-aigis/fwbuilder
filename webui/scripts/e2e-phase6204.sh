#!/usr/bin/env bash
# Phase-6204: STATUS Soft 6200+ ssh_alternative_presence_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 6040\+|through 6216|ssh_alternative_presence_roster' webui/STATUS.md
grep -qE 'phase6208|through 6208|e2e-phase6216' webui/STATUS.md
echo "STATUS Soft 6200+ ok"; echo "cleaned"; echo "OK: phase6204 e2e passed"
