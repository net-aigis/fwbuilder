#!/usr/bin/env bash
# Phase-3484: STATUS mentions Soft 3480+ / 3481-3488.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 3480\+|3480\+ Checkpoint|Soft-3480' webui/STATUS.md
grep -qE 'phase3488|through 3488|e2e-phase3488' webui/STATUS.md
echo "STATUS Soft 3480+ ok"
echo "cleaned"
echo "OK: phase3484 e2e passed"
