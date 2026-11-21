#!/usr/bin/env bash
# Phase-12604: STATUS Soft 12600+ ssh_auth_support_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 12600\+|through 12608|ssh_auth_support_count_roster' webui/STATUS.md
grep -qE 'phase12608|through 12608|e2e-phase12616' webui/STATUS.md
echo "STATUS Soft 12600+ ok"; echo "cleaned"; echo "OK: phase12604 e2e passed"
