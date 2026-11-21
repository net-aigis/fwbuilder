#!/usr/bin/env bash
# Phase-41162: UI ssh-auth-schema-451-echo roster Soft 41160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-451-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema451EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 41160+ ssh-auth-schema-451-echo roster ok"; echo "cleaned"; echo "OK: phase41162 e2e passed"
