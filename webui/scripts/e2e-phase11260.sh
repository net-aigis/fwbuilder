#!/usr/bin/env bash
# Phase-11260: STATUS mentions ssh_auth_bundle_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_bundle_hint_roster|soft_fertig_ssh_auth_bundle_hint_roster' webui/STATUS.md
grep -qE 'phase11264|through 11264|e2e-phase11264' webui/STATUS.md
echo "STATUS ssh-auth-bundle-hint roster ok"; echo "cleaned"; echo "OK: phase11260 e2e passed"
