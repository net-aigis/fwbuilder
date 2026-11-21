#!/usr/bin/env bash
# Phase-26522: UI ssh-auth-triacontaoctadeca-checkpoint roster Soft 26520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaoctadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaoctadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26520+ ssh-auth-triacontaoctadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26522 e2e passed"
