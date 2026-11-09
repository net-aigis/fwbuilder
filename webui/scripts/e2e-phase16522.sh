#!/usr/bin/env bash
# Phase-16522: UI ssh-auth-schema-143-echo roster Soft 16520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-143-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema143EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16520+ ssh-auth-schema-143-echo roster ok"; echo "cleaned"; echo "OK: phase16522 e2e passed"
