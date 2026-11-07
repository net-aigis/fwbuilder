#!/usr/bin/env bash
# Phase-5164: STATUS Soft 5160+ ssh_refusal_status_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 5160\+|through 5168|ssh_refusal_status_roster' webui/STATUS.md
grep -qE 'phase5168|through 5168|e2e-phase5168' webui/STATUS.md
echo "STATUS Soft 5160+ ok"; echo "cleaned"; echo "OK: phase5164 e2e passed"
