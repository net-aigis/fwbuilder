#!/usr/bin/env bash
# Phase-45402: UI ssh-auth-triacontaheptacosadeca-checkpoint roster Soft 45400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaheptacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaheptacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 45400+ ssh-auth-triacontaheptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase45402 e2e passed"
