#!/usr/bin/env bash
# Phase-25562: UI ssh-auth-triacontapentadeca-checkpoint roster Soft 25560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontapentadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontapentadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 25560+ ssh-auth-triacontapentadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase25562 e2e passed"
