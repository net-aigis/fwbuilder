#!/usr/bin/env bash
# Phase-820: STATUS mentions stacked samples / 817-824.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'stacked_sections|stacked=|emptyStacked' webui/STATUS.md
grep -qE 'phase824|through 824|e2e-phase824' webui/STATUS.md
echo "STATUS stacked sample ok"
echo "cleaned"
echo "OK: phase820 e2e passed"
