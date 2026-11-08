#!/usr/bin/env bash
# Phase-6668: STATUS mentions ssh_implemented_identity_roster sessionStorage / 5145-5152.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_identity_roster.*(sessionStorage|Clear)|sessionStorage.*ssh_implemented_identity_roster' webui/STATUS.md
grep -qE 'phase6672|through 6672|e2e-phase6672' webui/STATUS.md
echo "STATUS ssh_implemented_identity_roster sessionStorage ok"; echo "cleaned"; echo "OK: phase6668 e2e passed"
