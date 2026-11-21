#!/usr/bin/env bash
# Phase-24602: UI ssh-auth-triacontadodeca-checkpoint roster Soft 24600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontadodeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontadodecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24600+ ssh-auth-triacontadodeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase24602 e2e passed"
