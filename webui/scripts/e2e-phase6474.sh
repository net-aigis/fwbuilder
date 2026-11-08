#!/usr/bin/env bash
# Phase-6474: UI honesty bundle includes ssh_auth_note_snapshot_roster section.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'ssh_auth_note_snapshot_roster:' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'soft_fertig_ssh_auth_note_snapshot_roster:' webui/frontend/src/components/FirewallExtras.tsx
echo "UI ssh_auth_note_snapshot_roster bundle section ok"; echo "cleaned"; echo "OK: phase6474 e2e passed"
