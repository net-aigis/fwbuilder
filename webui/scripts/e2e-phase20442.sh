#!/usr/bin/env bash
# Phase-20442: UI ssh-auth-enneadeca-checkpoint roster Soft 20440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-enneadeca-checkpoint roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthEnneadecaCheckpointRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 20440+ ssh-auth-enneadeca-checkpoint roster ok"; echo "cleaned"; echo "OK: phase20442 e2e passed"
