#!/usr/bin/env bash
# Phase-1436: STATUS mentions honesty paths download / 1433-1440.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qE 'Download honesty paths|honesty paths (download|copy)' webui/STATUS.md
grep -qE 'phase1440|through 1440|e2e-phase1440' webui/STATUS.md
echo "STATUS honesty paths download ok"
echo "cleaned"
echo "OK: phase1436 e2e passed"
