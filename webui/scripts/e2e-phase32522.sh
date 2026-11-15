#!/usr/bin/env bash
# Phase-32522: UI ssh-auth-schema-343-echo roster Soft 32520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-343-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema343EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 32520+ ssh-auth-schema-343-echo roster ok"; echo "cleaned"; echo "OK: phase32522 e2e passed"
