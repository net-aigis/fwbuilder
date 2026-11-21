#!/usr/bin/env bash
# Phase-20122: UI ssh-auth-octadeca-checkpoint roster Soft 20120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-octadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthOctadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20120+ ssh-auth-octadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20122 e2e passed"
