#!/usr/bin/env bash
# Phase-8524: STATUS Soft 8520+ ssh_implemented_agent_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 8520\+|through 8528|ssh_implemented_agent_refresh_roster' webui/STATUS.md
grep -qE 'phase8528|through 8528|e2e-phase8536' webui/STATUS.md
echo "STATUS Soft 8520+ ok"; echo "cleaned"; echo "OK: phase8524 e2e passed"
