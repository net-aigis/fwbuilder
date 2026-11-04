#!/usr/bin/env bash
# Phase-398: STATUS documents read_only + refuse paths 393–400.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase393\|e2e-phase393' webui/STATUS.md
grep -q 'phase400\|e2e-phase400' webui/STATUS.md
grep -qi 'read_only\|readOnly' webui/STATUS.md
echo "STATUS 393-400 ok"
echo "cleaned"
echo "OK: phase398 e2e passed"
