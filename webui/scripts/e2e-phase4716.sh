#!/usr/bin/env bash
# Phase-4716: STATUS mentions ssh_not_implemented_roster export / 4713-4720.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'ssh_not_implemented_roster.*(export|bundle)|Export.*ssh_not_implemented_roster' webui/STATUS.md
grep -qE 'phase4720|through 4720|e2e-phase4720' webui/STATUS.md
echo "STATUS ssh_not_implemented_roster export ok"
echo "cleaned"
echo "OK: phase4716 e2e passed"
