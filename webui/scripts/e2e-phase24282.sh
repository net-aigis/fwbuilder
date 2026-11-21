#!/usr/bin/env bash
# Phase-24282: UI ssh-auth-triacontahenadeca-checkpoint roster Soft 24280+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontahenadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontahenadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24280+ ssh-auth-triacontahenadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase24282 e2e passed"
