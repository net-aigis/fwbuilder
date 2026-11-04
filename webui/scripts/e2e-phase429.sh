#!/usr/bin/env bash
# Phase-429: STATUS 425–432.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase425\|e2e-phase425' webui/STATUS.md
grep -q 'phase432\|e2e-phase432' webui/STATUS.md
grep -qi 'ipcop\|secuwall\|iface_option_enable' webui/STATUS.md
echo "STATUS 425-432 ok"
echo "cleaned"
echo "OK: phase429 e2e passed"
