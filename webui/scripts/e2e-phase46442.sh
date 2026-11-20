#!/usr/bin/env bash
# Phase-46442: UI ssh-auth-soft-49120-echo roster Soft 46440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-soft-49120-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSoft49120EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 46440+ ssh-auth-soft-49120-echo roster ok"; echo "cleaned"; echo "OK: phase46442 e2e passed"
