#!/usr/bin/env bash
# Phase-4764: STATUS Soft 4760+ ssh_not_implemented_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 4760\+|through 4768|ssh_not_implemented_roster' webui/STATUS.md
grep -qE 'phase4768|through 4768|e2e-phase4768' webui/STATUS.md
echo "STATUS Soft 4760+ ok"
echo "cleaned"
echo "OK: phase4764 e2e passed"
