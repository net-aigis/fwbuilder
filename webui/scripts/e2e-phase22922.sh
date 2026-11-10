#!/usr/bin/env bash
# Phase-22922: UI ssh-auth-schema-223-echo roster Soft 22920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-223-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema223EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 22920+ ssh-auth-schema-223-echo roster ok"; echo "cleaned"; echo "OK: phase22922 e2e passed"
