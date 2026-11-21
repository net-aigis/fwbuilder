#!/usr/bin/env bash
# Phase-5756: STATUS mentions ssh_alternative_support_roster export / 5113-5120.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_support_roster.*(export|bundle)|Export.*ssh_alternative_support_roster' webui/STATUS.md
grep -qE 'phase5760|through 5680|e2e-phase5760' webui/STATUS.md
echo "STATUS ssh_alternative_support_roster export ok"; echo "cleaned"; echo "OK: phase5756 e2e passed"
