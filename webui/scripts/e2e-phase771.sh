#!/usr/bin/env bash
# Phase-771: STATUS mentions spacer Maximum/Minimum/Preferred / 769-776.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'spacer.*Maximum|Maximum/Minimum/Preferred|data-size-type.*Maximum' webui/STATUS.md
grep -qE 'phase776|through 776|e2e-phase776' webui/STATUS.md
echo "STATUS spacer sizeTypes ok"
echo "cleaned"
echo "OK: phase771 e2e passed"
