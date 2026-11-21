#!/usr/bin/env bash
# Phase-423: _OPTION_OPTION_ENABLE table present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq '_OPTION_OPTION_ENABLE' webui/backend/fwbweb_api/platforms.py
grep -Fq 'ulog_cprange' webui/backend/fwbweb_api/platforms.py
echo "OPTION_OPTION_ENABLE table ok"
echo "cleaned"
echo "OK: phase423 e2e passed"
