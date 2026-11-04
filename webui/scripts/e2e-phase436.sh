#!/usr/bin/env bash
# Phase-436: STATUS 433–440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -q 'phase433\|e2e-phase433' webui/STATUS.md
grep -q 'phase440\|e2e-phase440' webui/STATUS.md
grep -qi 'enable rules\|field-ui-readonly\|readonly' webui/STATUS.md
echo "STATUS 433-440 ok"
echo "cleaned"
echo "OK: phase436 e2e passed"
