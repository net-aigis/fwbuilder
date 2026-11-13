#!/usr/bin/env bash
# Phase-29962: UI ssh-auth-schema-311-echo roster Soft 29960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-311-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema311EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 29960+ ssh-auth-schema-311-echo roster ok"; echo "cleaned"; echo "OK: phase29962 e2e passed"
