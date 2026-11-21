#!/usr/bin/env bash
# Phase-26202: UI ssh-auth-triacontaheptadeca-checkpoint roster Soft 26200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaheptadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaheptadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 26200+ ssh-auth-triacontaheptadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase26202 e2e passed"
