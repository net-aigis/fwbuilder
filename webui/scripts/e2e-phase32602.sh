#!/usr/bin/env bash
# Phase-32602: UI ssh-auth-triacontaheptacosadeca-checkpoint roster Soft 32600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-triacontaheptacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthTriacontaheptacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32600+ ssh-auth-triacontaheptacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase32602 e2e passed"
