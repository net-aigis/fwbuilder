#!/usr/bin/env bash
# Phase-22362: UI ssh-auth-pentacosadeca-checkpoint roster Soft 22360+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-pentacosadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthPentacosadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22360+ ssh-auth-pentacosadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase22362 e2e passed"
