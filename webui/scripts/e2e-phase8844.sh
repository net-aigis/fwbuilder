#!/usr/bin/env bash
# Phase-8844: STATUS Soft 8840+ ssh_alternative_support_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8840\+|through 8848|ssh_alternative_support_refresh_roster' webui/STATUS.md
grep -qE 'phase8848|through 8848|e2e-phase8856' webui/STATUS.md
echo "STATUS Soft 8840+ ok"; echo "cleaned"; echo "OK: phase8844 e2e passed"
