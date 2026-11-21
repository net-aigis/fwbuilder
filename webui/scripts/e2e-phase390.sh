#!/usr/bin/env bash
# Phase-390: STATUS documents whats_this + hard-gap paths 385–392.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase385\|e2e-phase385' webui/STATUS.md
grep -q 'phase392\|e2e-phase392' webui/STATUS.md
grep -qi 'whats_this\|whatsThis' webui/STATUS.md
echo "STATUS 385-392 ok"
echo "cleaned"
echo "OK: phase390 e2e passed"
