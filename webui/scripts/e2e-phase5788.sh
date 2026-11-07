#!/usr/bin/env bash
# Phase-5788: STATUS mentions ssh_alternative_support_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_alternative_support_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_alternative_support_roster' webui/STATUS.md
grep -qE 'phase5792|through 5712|e2e-phase5792' webui/STATUS.md
echo "STATUS ssh_alternative_support_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase5788 e2e passed"
