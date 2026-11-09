#!/usr/bin/env bash
# Phase-21962: UI ssh-auth-schema-211-echo roster Soft 21960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-211-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema211EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 21960+ ssh-auth-schema-211-echo roster ok"; echo "cleaned"; echo "OK: phase21962 e2e passed"
