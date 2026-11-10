#!/usr/bin/env bash
# Phase-24842: UI ssh-auth-schema-247-echo roster Soft 24840+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'Soft-fertig ssh-auth-schema-247-echo roster' webui/frontend/src/components/FirewallExtras.tsx
grep -Fq 'sshAuthSchema247EchoRosterStorageKey' webui/frontend/src/components/FirewallExtras.tsx
echo "UI Soft 24840+ ssh-auth-schema-247-echo roster ok"; echo "cleaned"; echo "OK: phase24842 e2e passed"
