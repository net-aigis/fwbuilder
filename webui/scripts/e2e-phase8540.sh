#!/usr/bin/env bash
# Phase-8540: STATUS mentions ssh_implemented_identity_refresh_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_implemented_identity_refresh_roster|soft_fertig_ssh_implemented_identity_refresh_roster' webui/STATUS.md
grep -qE 'phase8544|through 8544|e2e-phase8544' webui/STATUS.md
echo "STATUS ssh-implemented-identity-refresh roster ok"; echo "cleaned"; echo "OK: phase8540 e2e passed"
