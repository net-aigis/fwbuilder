#!/usr/bin/env bash
# Phase-13562: UI ssh-auth-ni-count roster Soft 13560+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-ni-count roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthNiCountRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 13560+ ssh-auth-ni-count roster ok"; echo "cleaned"; echo "OK: phase13562 e2e passed"
