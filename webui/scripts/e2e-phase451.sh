#!/usr/bin/env bash
# Phase-451: STATUS 449–456.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase449\|e2e-phase449' webui/STATUS.md
grep -q 'phase456\|e2e-phase456' webui/STATUS.md
grep -qi 'dedupe\|duplicate type\|hide.*type' webui/STATUS.md
echo "STATUS 449-456 ok"
echo "cleaned"
echo "OK: phase451 e2e passed"
