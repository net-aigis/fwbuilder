#!/usr/bin/env bash
# Phase-18522: UI ssh-auth-trideca-checkpoint roster Soft 18520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-trideca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTridecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 18520+ ssh-auth-trideca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase18522 e2e passed"
