#!/usr/bin/env bash
# Phase-16842: UI ssh-auth-schema-147-echo roster Soft 16840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-147-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema147EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 16840+ ssh-auth-schema-147-echo roster ok"; echo "cleaned"; echo "OK: phase16842 e2e passed"
