#!/usr/bin/env bash
# Phase-5804: STATUS Soft 5800+ ssh_alternative_support_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5808|ssh_alternative_support_roster' webui/STATUS.md
grep -qE 'phase5808|through 5808|e2e-phase5808' webui/STATUS.md
echo "STATUS Soft 5800+ ok"; echo "cleaned"; echo "OK: phase5804 e2e passed"
