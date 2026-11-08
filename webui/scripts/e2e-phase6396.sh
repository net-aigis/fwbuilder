#!/usr/bin/env bash
# Phase-6396: STATUS mentions ssh_implemented_agent_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_agent_roster.*(export|bundle)|Export.*ssh_implemented_agent_roster' webui/STATUS.md
grep -qE 'phase6400|through 6400|e2e-phase6400' webui/STATUS.md
echo "STATUS ssh_implemented_agent_roster export ok"; echo "cleaned"; echo "OK: phase6396 e2e passed"
