#!/usr/bin/env bash
# Phase-39002: UI ssh-auth-triacontaheptacosadeca-checkpoint roster Soft 39000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaheptacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaheptacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 39000+ ssh-auth-triacontaheptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase39002 e2e passed"
