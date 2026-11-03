#!/usr/bin/env bash
# Phase-358: STATUS documents iface stacked sections 353–360.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase353\|e2e-phase353' webui/STATUS.md
grep -q 'phase360\|e2e-phase360' webui/STATUS.md
grep -qi 'Interface.*stack\|iface stack\|stacked.*Interface' webui/STATUS.md
echo "STATUS 353-360 ok"
echo "cleaned"
echo "OK: phase358 e2e passed"
