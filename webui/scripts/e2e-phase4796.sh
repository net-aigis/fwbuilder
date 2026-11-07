#!/usr/bin/env bash
# Phase-4796: STATUS mentions ssh_implemented_roster export / 4793-4800.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_roster.*(export|bundle)|Export.*ssh_implemented_roster' webui/STATUS.md
grep -qE 'phase4800|through 4800|e2e-phase4800' webui/STATUS.md
echo "STATUS ssh_implemented_roster export ok"; echo "cleaned"; echo "OK: phase4796 e2e passed"
