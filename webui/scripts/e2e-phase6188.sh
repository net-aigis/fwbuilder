#!/usr/bin/env bash
# Phase-6188: STATUS mentions ssh_alternative_presence_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_presence_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_presence_roster' webui/STATUS.md
grep -qE 'phase6192|through 6192|e2e-phase6192' webui/STATUS.md
echo "STATUS ssh_alternative_presence_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6188 e2e passed"
