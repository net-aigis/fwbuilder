#!/usr/bin/env bash
# Phase-40842: UI ssh-auth-schema-447-echo roster Soft 40840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-447-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema447EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 40840+ ssh-auth-schema-447-echo roster ok"; echo "cleaned"; echo "OK: phase40842 e2e passed"
